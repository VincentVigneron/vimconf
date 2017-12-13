#!/usr/bin/env python3

"""Foobar.py: Description of what foobar does."""

__author__ = "Rob Knight, Gavin Huttley, and Peter Maxwell"
__copyright__ = "Copyright 2007, The Cogent Project"
__credits__ = ["Rob Knight", "Peter Maxwell", "Gavin Huttley",
               "Matthew Wakefield"]
__license__ = "GPL"
__version__ = "1.0.1"
__maintainer__ = "Rob Knight"
__email__ = "rob@spot.colorado.edu"
__status__ = "Production"

import os
import argparse
import time
import sys
from PyPDF2 import PdfFileReader
from wand.image import Image
from itertools import groupby, accumulate
from subprocess import call


def is_page_color(file_name, page):
    """Returns if the page of the pdf file is in color."""
    # convert the pdf in image
    with Image(filename=file_name+'['+str(page)+']') as sheet:
        # check the color levels
        red = sheet.channel_depths['red']
        blue = sheet.channel_depths['blue']
        green = sheet.channel_depths['green']
        black = (red == 1) and (blue == 1) and (green == 1)
    return not black


def pdf_sheets_color(file_name, numpages):
    """Generator yielding the color of the sheets."""
    for page in range(0, numpages, 2):
        color = is_page_color(file_name, page) or (
            (page+1 < numpages) and is_page_color(file_name, page+1))
        yield color


def print_pdf(file_name, black, color, delay=10):
    with open(file_name, 'rb') as file_input:
        file_pdf = PdfFileReader(file_input)
        numpages = file_pdf.getNumPages()

    # Group together the adjacent color (resp. grayscale) sheets
    sheets = ({
        'color': is_color,
        'first': 1,
        'last': min(numpages, 2*len(list(nsheets)))
        }
        for is_color, nsheets
        in groupby(pdf_sheets_color(file_name, numpages)))
    sheets = [sheet for sheet in accumulate(
        sheets,
        lambda prev, curr: {
            'color': curr['color'],
            'first': curr['first']+prev['last'],
            'last': min(numpages, curr['last']+prev['last'])
        })]

    print_cmd = (
            'lp {file} -d {printer} -n 1 '
            '-o sides=two-sided-long-edge '
            '-o ColorModel={color} '
            '-P {first}-{last}')
    for sheet in sheets:
        is_color = sheet['color']
        first = sheet['first']
        last = sheet['last']
        options = {'file': file_name, 'first': first, 'last': last}
        if is_color:
            options['printer'] = color
            options['color'] = 'color'
        else:
            options['printer'] = black
            options['color'] = 'grayscale'
        print(print_cmd.format(**options))
        try:
            call(print_cmd.format(**options), shell=True)
            time.sleep(delay)
        except OSError as e:
            sys.exit('Échec de l\'impression')


parser = argparse.ArgumentParser()
parser.add_argument('--file', help='Fichier à imprimer.', required=True)
parser.add_argument('--color', help='Nom de l\'imprimante couleurs.',
                    required=True)
parser.add_argument('--black', help='Nom de l\'imprimante noire et blanc.')
args = parser.parse_args()

file_name = getattr(args, 'file')
if not os.path.isfile(file_name):
    sys.exit('Le fichier \'{}\' n\'existe pas.'.format(file_name))

black = getattr(args, 'black')
color = getattr(args, 'color')
if black is None:
    black = color
if color is None:
    sys.exit('Il faut au moins spécifier l\'imprimante couleurs.')

print_pdf(file_name, black, color)

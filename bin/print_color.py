#!/usr/bin/env python3

import os
import argparse
import time
import sys
from PyPDF2 import PdfFileReader
from wand.image import Image
from itertools import groupby, accumulate
from subprocess import call


def page_color(file_name, page):
    # convert the pdf in image
    with Image(filename=file_name+'['+str(page)+']') as sheet:
        # check the color levels
        red = sheet.channel_depths['red']
        blue = sheet.channel_depths['blue']
        green = sheet.channel_depths['green']
        color = (red == 1) and (blue == 1) and (green == 1)
    return not color


def pdf_sheet_color(file_name, numpages):
    for page in range(0, numpages, 2):
        color = page_color(file_name, page) or (
            (page+1 < numpages) and page_color(file_name, page+1))
        yield color


def print_pdf(file_name, black, color, delay=10):
    # Open the pdf to check the number of pages
    with open(file_name, 'rb') as file_input:
        file_pdf = PdfFileReader(file_input)
        numpages = file_pdf.getNumPages()

    # Check the color of each pair of pages (sheet)
    # and group the adjacent color sheets
    # (resp. grayscale sheets)
    sheets = ({
        'color': is_color,
        'first': 1,
        'last': min(numpages, 2*len(list(sheets)))
        }
        for is_color, sheets
        in groupby(pdf_sheet_color(file_name, numpages)))
    # Compute the range of color (resp. grayscale) sheets
    # from the previous list
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
    for pages in sheets:
        is_color = pages['color']
        first = pages['first']
        last = pages['last']
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
parser.add_argument('--black', help='Nom de l\'imprimante noire et blanc.')
parser.add_argument('--color', help='Nom de l\'imprimante couleurs.')
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

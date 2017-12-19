#!/usr/bin/env python3

import os
import argparse
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


def extract_range(file_name, sheets_range, name):
    colors_range = ','.join(sheets_range)
    basename = os.path.splitext(file_name)[0]
    cmd = 'pdfjam {file} \'{range}\' --outfile {basename}-{suffix}.pdf'
    options = {
            'file': file_name,
            'range': colors_range,
            'basename': basename,
            'suffix': name}
    print(cmd.format(**options))
    try:
        call(cmd.format(**options), shell=True)
    except OSError as e:
        print >>sys.stderr, 'Extraction failde:', e
        sys.exit('Échec de l\'impression')


def extract_pdf(file_name):
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

    colors = [
            '{}-{}'.format(sheet['first'], sheet['last'])
            for sheet in sheets if sheet['color']]
    blacks = [
            '{}-{}'.format(sheet['first'], sheet['last'])
            for sheet in sheets if not sheet['color']]
    extract_range(file_name, colors, 'color')
    extract_range(file_name, blacks, 'black')


parser = argparse.ArgumentParser()
parser.add_argument('--file', help='Fichier à imprimer.', required=True)
args = parser.parse_args()

file_name = getattr(args, 'file')
if not os.path.isfile(file_name):
    sys.exit('Le fichier \'{}\' n\'existe pas.'.format(file_name))


extract_pdf(file_name)

#! /usr/bin/env python
__author__ = 'bbowman@pacificbiosciences.com'

from report import SmrtHmlReportWriter

if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()

    add = parser.add_argument
    add('job', metavar='JOB',
        help="Folder of Amplicon Analysis output from SMRT Pipe or Portal")
    add('typing', metavar='TYPING',
        help="File of typing results in *.Typing or *.xml format")
    add('-o', '--output', metavar='OUTPUT', default='output.xml',
        help="Output file to write the HML-formated data to")
    add('--debug', action='store_true',
        help="Flag to enable Debug mode")
    args = parser.parse_args()

    writer = SmrtHmlReportWriter( args.typing, args.job )
    writer.write_report("F3--R3", args.output)


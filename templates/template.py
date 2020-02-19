#!/usr/bin/env python3
"""Default template for my python files"""

__author__="Tyler Westland"

import argparse
import os

def parse_arguments(args=None):
    """Main function of this file

    Arguments:
    args: List of strings to be parsed by argparse.
        None results in argparse using the values passed into
        sys.args.
    """
    parser = argparse.ArgumentParser(
            description="A default template for python",
            formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("input_file", help="Path to the input file.")
    parser.add_argument("-o", "--output_file", help="Path to the output file.",
            default="output")
    parser.add_argument("-q", "--quiet", help="Don't print out non-errors",
                        default=False, action="store_true")
    args = parser.parse_args(args=args)
    return args


def main(input_file, quiet=False, output_file="output"):
    """Main function.

    Arguments:
    input_file: Path the input file.
    output_file: Path to the output file.
    quiet: Rather non-errors should be printed.
    """
    # Error check if the file even exists
    if not os.path.isfile(input_file):
        raise FileNotFoundError("File not found: {}".format(input_file))

    # Return success code
    return 0


# Execute only if this file is being run as the entry file.
if __name__ == "__main__":
    import sys
    args = parse_arguments()
    try:
        exit(main(**vars(args)))
    except FileNotFoundError as exp:
        print(exp, file=sys.stderr)
        exit(-1)


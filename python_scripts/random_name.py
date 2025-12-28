#!/usr/bin/env python3
"""Default template for my python files"""

__author__="Tyler Westland"

import argparse
import json
import os
import random
import sys

SCRIPT_DIR=os.path.dirname(os.path.abspath(__file__))



def parse_arguments(args=None) -> argparse.Namespace:
    """Returns the parsed arguments.
    Parameters
    ----------
    args: List of strings to be parsed by argparse.
        The default None results in argparse using the values passed into
        sys.args.
    """
    parser = argparse.ArgumentParser(
            description="A default template for python",
            formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("-n", "--number", default=10, help="Number of Names")
    parser.add_argument("-i", "--input_file", default=f"{SCRIPT_DIR}/names.txt", help="Name file")
    args = parser.parse_args(args=args)
    return args


def main(input_file:str, number:int, output_file:str="output") -> None:
    """Main wrapper.

    Parameters
    ----------
    number: int
        Number of random names to print
    input_file: str
        Path the input file.
    Raises
    ------
    FileNotFoundError
        Means that the input file was not found.
    """
    # Parse inputs
    # Error check if the file even exists
    if not os.path.isfile(input_file):
        raise FileNotFoundError("File not found: {}".format(input_file))

    with open(input_file) as fin:
        all_names = fin.read().split("\n")

    choices = random.choices(all_names, k=number)

    print("\n".join(choices))


def cli() -> None:
    """Get program arguments from command line and run main"""
    args = parse_arguments()
    try:
        main(**vars(args))
        sys.exit(0)
    except FileNotFoundError as exp:
        print(exp, file=sys.stderr)
        sys.exit(1)


# Execute only if this file is being run as the entry file.
if __name__ == "__main__":
    cli()

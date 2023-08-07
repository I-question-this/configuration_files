#!/usr/bin/env python3
"""Default template for my python files"""

__author__="Tyler Westland"

import argparse
import json
import os
import sys


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
    parser.add_argument("input_file", help="Path to the input file.")
    parser.add_argument("-o", "--output_file", help="Path to the output file.",
            default="output")
    args = parser.parse_args(args=args)
    return args


def parse_file_input(input_file:str) -> dict:
    with open(input_file) as fin:
        return json.load(fin)


def parse_file_output(output_data: dict, output_file:str):
    with open(output_file, "w") as fout:
        json.dump(output_data, fout)


def main_wrapper(input_file:str, quiet:bool=False, output_file:str="output") -> None:
    """Main wrapper.

    Parameters
    ----------
    input_file: str
        Path the input file.
    output_file: str
        Path to the output file. Default is 'output'
    Raises
    ------
    FileNotFoundError
        Means that the input file was not found.
    """
    # Parse inputs
    # Error check if the file even exists
    if not os.path.isfile(input_file):
        raise FileNotFoundError("File not found: {}".format(input_file))

    input_data = parse_file_input(input_file)

    # Run the main function
    output_data = main(input_data)

    # Handle outputs
    parse_file_output(output_data, output_file)


def main(input_data: dict) -> dict:
    # Capitalize all data within dict
    for key in input_data:
        input_data[key] = input_data[key].capitalize()

    return input_data


def cli() -> None:
    """Get program arguments from command line and run main"""
    args = parse_arguments()
    try:
        main_wrapper(**vars(args))
        sys.exit(0)
    except FileNotFoundError as exp:
        print(exp, file=sys.stderr)
        sys.exit(1)


# Execute only if this file is being run as the entry file.
if __name__ == "__main__":
    cli()

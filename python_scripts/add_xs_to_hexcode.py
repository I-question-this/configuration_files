#!/usr/bin/env python3

import argparse
import os

def main(args=None):
    parser = argparse.ArgumentParser(args)
    parser.add_argument("path", help="Path to the input file.")
    parser.add_argument("--quiet", help="Don't print out non-errors",
                        default=False, action="store_true")
    args = parser.parse_args(args=args)

    # Error check if the file even exists
    if not os.path.isfile(args.path):
        raise FileNotFoundError("File not found: {}".format(args.path))

    # Read the file
    with open(args.path, "r") as fin:
        line = fin.read().strip()

    # Check the length
    if len(line) % 2 != 0:
        raise ValueError("Length is not an even number")

    # Check if not hex
    # TODO

    # Add the x things
    x_line = ""
    for ind in range(0, len(line), 2):
        x_line += "\\x{}".format(line[ind:ind+2])

    # Print the x_line
    print(x_line)

    # Return success code
    return 0

if __name__ == "__main__":
    import sys
    try:
        exit(main())
    except FileNotFoundError as exp:
        print(exp, file=sys.stderr)
        exit(-1)
    except ValueError as exp:
        print(exp, file=sys.stderr)
        exit(-2)


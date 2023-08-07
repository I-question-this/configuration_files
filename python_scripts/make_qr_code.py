#!/usr/bin/env python3
"""Makes a QR code.
Adapted from: https://www.thepythoncode.com/article/generate-read-qr-code-python
"""

__author__="Tyler Westland"

import argparse
import qrcode
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
            description="Makes a QR code.\n"
                        "Adapted from: "
                        "https://www.thepythoncode.com/article/generate-read-qr-code-python",
            formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("input_data", help="Data to put in the QR code.")
    parser.add_argument("-o", "--output_path", help="Path to the output image.",
            default="qr.png")
    args = parser.parse_args(args=args)
    return args


def main(input_data:str, output_path:str="qr.png") -> "qrcode.image.pil.PilImage":
    """Main function.

    Parameters
    ----------
    input_data: str
        Data to put in the QR code.
    output_path: str
        Path to the output image.
    Returns
    -------
    qrcode.image.pil.PilImage
        The qrcode image object
    Raises
    ------
    FileNotFoundError
        Means that the input file was not found.
    """
    # Make the image
    img = qrcode.make(input_data)

    # Save the image
    img.save(output_path)

    # Return the image
    return img


def cli_interface() -> None:
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
    cli_interface()

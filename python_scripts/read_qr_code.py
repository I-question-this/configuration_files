#!/usr/bin/env python3
"""Reads QR code, and attempts to highlight it.
Adapted from: https://www.thepythoncode.com/article/generate-read-qr-code-python
"""

__author__="Tyler Westland"

import argparse
import cv2
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
            description="Reads QR code, and attempts to highlight it.\n"
                        "Adapted from: "
                        "https://www.thepythoncode.com/article/generate-read-qr-code-python",
            formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("input_image", help="Path to the input image.")
    args = parser.parse_args(args=args)
    return args


def main(input_image:str) -> str:
    """Main function.

    Parameters
    ----------
    input_image: str
        Path the input image.
    Returns
    -------
    str
        The data within the QRcode.
    Raises
    ------
    FileNotFoundError
        Means that the input file was not found.
    """
    # Error check if the image even exists
    if not os.path.isfile(input_image):
        raise FileNotFoundError("Image not found: {}".format(input_image))

    # read the QRCODE image
    img = cv2.imread(input_image)

    # initialize the cv2 QRCode detector
    detector = cv2.QRCodeDetector()

    # detect and decode
    data, bbox, straight_qrcode = detector.detectAndDecode(img)

    # if there is a QR code
    if bbox is not None:
        print(f"QRCode data:\n{data}")
        # display the image with lines
        # length of bounding box
        n_lines = len(bbox)
        for i in range(n_lines):
            # draw all lines
            point1 = tuple(int(x) for x in bbox[i][0])
            point2 = tuple(int(x) for x in bbox[(i+1) % n_lines][0])
            cv2.line(img, point1, point2, color=(0, 0, 0), thickness=2)

        # display the result
        cv2.imshow("img", img)
        cv2.waitKey(0)
        cv2.destroyAllWindows()

    return data


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

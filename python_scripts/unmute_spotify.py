#!/usr/bin/env python3
"""UNMUTE SPOTIFY WITH PULSEMIXER"""

__author__="Tyler Westland"

import argparse
import os
import subprocess


def parse_arguments(args=None) -> None:
    """Returns the parsed arguments.

    Parameters
    ----------
    args: List of strings to be parsed by argparse.
        The default None results in argparse using the values passed into
        sys.args.
    """
    parser = argparse.ArgumentParser(
            description="Unmute Spotify with pulsemixer. Damn those who mute "\
                    "our Spotify.",
            formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("-q", "--quiet", help="Don't print out errors",
                        default=False, action="store_true")
    args = parser.parse_args(args=args)
    return args


def break_up_sink_info(sink_info:str) -> dict:
    """Break up the info into a dictionary.

    Parameters
    ----------
    sink_info: str
        The sink info from pulsemixer.

    Returns
    -------
    dict
        A dictionary of sink information.
    """
    pieces = sink_info.split(",")
    if "\t" in pieces[0]:
        # Split up the first item
        pieces[0] = pieces[0].split("\t")[1]

    pieces_dict = {} 
    for p in pieces:
        p_pieces = p.split(":")
        if len(p_pieces) == 2:
            pieces_dict[p_pieces[0].replace(" ", "")] =\
                    p_pieces[1].replace(" ", "")

    return pieces_dict


def main(quiet:False) -> int:
    """Main function.

    Parameters
    ----------
    quiet: bool
        Rather non-errors should be printed. Default is False
    Returns
    -------
    int
        The exit code.
    Raises
    ------
    FileNotFoundError
        Means that the input file was not found.
    """
    # All the sinks/sources
    everything = subprocess.run(("pulsemixer", "-l"), capture_output=True)
    everything = everything.stdout.decode("utf-8").split("\n")

    # Get only the Spotify sinks
    spotify_instances = list(filter(lambda item: "spotify" in item.lower(),
            everything))

    # Unmute each Spotify sink
    for item in spotify_instances:
        # Break up the information for the sinks
        info = break_up_sink_info(item)
        res = subprocess.run(("pulsemixer", "--unmute",
            "--id", info["ID"]), capture_output=True)
        if quiet:
            print(res.stderr.decode("utf-8"))

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


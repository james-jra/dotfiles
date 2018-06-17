#!/usr/bin/env python

import argparse
import json


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("inputfile", help="path to colourscheme JSON file")
    parser.add_argument("-f", "--format", choices=["rgb", "hsv", "hex"], default="rgb")
    return parser.parse_args()


def hex_to_rgb(hex_colour):
    if isinstance(hex_colour, str):
        hex_colour = int(hex_colour, 16)
    return tuple((hex_colour >> shift) & 0xFF for shift in (16, 8, 0))


def main():
    args = parse_args()
    hexmap = {}
    with open(args.inputfile, "r") as fd:
        hexmap = json.load(fd)

    for colour, subcolours in hexmap.items():
        for sc_name, sc_hex in subcolours.items():
            print("Colour: {} {} {}".format(colour, sc_name, hex_to_rgb(sc_hex)))


if __name__ == "__main__":
    main()

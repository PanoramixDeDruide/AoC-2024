#!/bin/bash
< input sed "s|)|)\n|g" | grep -E "mul\([0-9]+,[0-9]+\)" | sed -E "s|^.*mul\(([0-9]+),([0-9]+)\).*$|\1 * \2|" > input3
./solver.sh


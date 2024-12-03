#!/bin/bash
< input sed "s|don't()|\ndon't()\n|g" | sed "s|do()|\ndo()\n|g" > input2
./solver2.sh
 < input2b tr '\n' '0' | sed "s|)|)\n|g" | grep -E "mul\([0-9]+,[0-9]+\)" | sed -E "s|^.*mul\(([0-9]+),([0-9]+)\).*$|\1 * \2|" > input3
./solver.sh


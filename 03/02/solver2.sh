#!/bin/bash

ok=1
touch input2b
while read line; do
if [[ $line == "don't()" ]]; then
  ok=0
elif [[ $line == "do()" ]]; then
  ok=1
fi
if [[ $ok -eq 1 ]]; then
  echo "$line" >> input2b
fi
done < input2

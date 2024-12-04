#!/bin/bash
height=`< input wc -l`
line0=`< input head -n1`
width=${#line0}
y=2
solutions=0
echo "$height lines total..."
let "newheight = height - 1"
while [[ $y -le $newheight ]]; do
  echo "Line $y out of $height..."
  line=`head -n$y input | tail -n1`
  x=1
  let "newwidth = width - 1"
  while [[ $x -lt $newwidth ]]; do
    char1=${line:x:1}
    if [[ $char1 == "A" ]]; then
      let "right1 = x + 1"
      let "left1 = x - 1"
      let "top1 = y - 1"
      let "bot1 = y + 1"
      line1=`head -n$top1 input | tail -n1`
      line2=`head -n$bot1 input | tail -n1`
      if [[ ${line1:left1:1} == "M" ]] && [[ ${line2:right1:1} == "S" ]] && [[ ${line1:right1:1} == "M" ]] && [[ ${line2:left1:1} == "S" ]]; then
        let "solutions = solutions + 1"
      elif [[ ${line1:left1:1} == "S" ]] && [[ ${line2:right1:1} == "M" ]] && [[ ${line1:right1:1} == "M" ]] && [[ ${line2:left1:1} == "S" ]]; then
        let "solutions = solutions + 1"
      elif [[ ${line1:left1:1} == "M" ]] && [[ ${line2:right1:1} == "S" ]] && [[ ${line1:right1:1} == "S" ]] && [[ ${line2:left1:1} == "M" ]]; then
        let "solutions = solutions + 1"
      elif [[ ${line1:left1:1} == "S" ]] && [[ ${line2:right1:1} == "M" ]] && [[ ${line1:right1:1} == "S" ]] && [[ ${line2:left1:1} == "M" ]]; then
        let "solutions = solutions + 1"
      fi
    fi
    let "x = x + 1"
  done
  let "y = y + 1"
done
echo "$solutions"

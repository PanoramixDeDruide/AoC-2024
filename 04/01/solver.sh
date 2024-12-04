#!/bin/bash
height=`< input wc -l`
line0=`< input head -n1`
width=${#line0}
y=1
solutions=0
echo "$height lines total..."
while [[ $y -le $height ]]; do
  echo "Line $y out of $height..."
  line=`head -n$y input | tail -n1`
  x=0
  while [[ $x -lt $width ]]; do
    char1=${line:x:1}
    if [[ $char1 == "X" ]]; then
      let "right1 = x + 1"
      let "right2 = x + 2"
      let "right3 = x + 3"
      if [[ ${line:right1:1} == "M" ]] && [[ ${line:right2:1} == "A" ]] && [[ ${line:right3:1} == "S" ]]; then
        let "solutions = solutions + 1"
      fi
      if [[ $x -ge 3 ]]; then
        let "left1 = x - 1"
        let "left2 = x - 2"
        let "left3 = x - 3"
        if [[ ${line:left1:1} == "M" ]] && [[ ${line:left2:1} == "A" ]] && [[ ${line:left3:1} == "S" ]]; then
          let "solutions = solutions + 1"
        fi
      fi
      if [[ $y -gt 3 ]]; then
        let "top1 = y - 1"
        let "top2 = y - 2"
        let "top3 = y - 3"
        line1=`head -n$top1 input | tail -n1`
        line2=`head -n$top2 input | tail -n1`
        line3=`head -n$top3 input | tail -n1`
        let "right1 = x + 1"
        let "right2 = x + 2"
        let "right3 = x + 3"
        if [[ ${line1:x:1} == "M" ]] && [[ ${line2:x:1} == "A" ]] && [[ ${line3:x:1} == "S" ]]; then
          let "solutions = solutions + 1"
        fi
        if [[ ${line1:right1:1} == "M" ]] && [[ ${line2:right2:1} == "A" ]] && [[ ${line3:right3:1} == "S" ]]; then
          let "solutions = solutions + 1"
        fi
        if [[ $x -ge 3 ]]; then
          let "left1 = x - 1"
          let "left2 = x - 2"
          let "left3 = x - 3"
          if [[ ${line1:left1:1} == "M" ]] && [[ ${line2:left2:1} == "A" ]] && [[ ${line3:left3:1} == "S" ]]; then
            let "solutions = solutions + 1"
          fi
        fi
      fi
      let "y2 = y + 3"
      if [[ $y2 -le $height ]]; then
        let "bot1 = y + 1"
        let "bot2 = y + 2"
        let "bot3 = y + 3"
        line1=`head -n$bot1 input | tail -n1`
        line2=`head -n$bot2 input | tail -n1`
        line3=`head -n$bot3 input | tail -n1`
        let "right1 = x + 1"
        let "right2 = x + 2"
        let "right3 = x + 3"
        if [[ ${line1:x:1} == "M" ]] && [[ ${line2:x:1} == "A" ]] && [[ ${line3:x:1} == "S" ]]; then
          let "solutions = solutions + 1"
        fi
        if [[ ${line1:right1:1} == "M" ]] && [[ ${line2:right2:1} == "A" ]] && [[ ${line3:right3:1} == "S" ]]; then
          let "solutions = solutions + 1"
        fi
        if [[ $x -ge 3 ]]; then
          let "left1 = x - 1"
          let "left2 = x - 2"
          let "left3 = x - 3"
          if [[ ${line1:left1:1} == "M" ]] && [[ ${line2:left2:1} == "A" ]] && [[ ${line3:left3:1} == "S" ]]; then
            let "solutions = solutions + 1"
          fi
        fi
      fi
    fi
    let "x = x + 1"
  done
  let "y = y + 1"
done
echo "$solutions"

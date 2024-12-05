#!/bin/bash

sum=0
lin=0
< orders wc -l
while read order; do
  echo "$lin"
  let "lin = lin + 1"
  echo "$order" | tr ',' '\n' > vals
  cool=1
  while read rule; do
    echo "$rule" | tr '|' '\n' > vals2
    found=0
    while read val2; do
      < vals grep -q "$val2"
      res=$?
      if [[ $res -eq 0 ]]; then
        let "found = found + 1"
      fi
    done < vals2
    if [[ $found -eq 2 ]]; then
      left=`echo "$rule" | sed -E "s/\|..$//g"`
      right=`echo "$rule" | sed -E "s/^..\|//g"`
      echo "$order" | grep -q "$left.*$right"
      res=$?
      if [[ $res -ne 0 ]]; then
        cool=0
        break
      fi
    fi
  done < rules
  if [[ $cool -eq 1 ]]; then
    len=`< vals wc -l`
    linenum=`echo "$len/2+1" | bc`
    line=`head -n$linenum vals | tail -n1`
    let "sum = sum + line"
  fi
done < orders
echo "$sum"

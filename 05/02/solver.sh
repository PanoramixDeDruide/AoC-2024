#!/bin/bash

sum=0
< orders wc -l
lin=1
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
  if [[ $cool -ne 1 ]]; then
    rm -f vals3
    touch vals3
    prog=`< vals3 wc -l`
    len=`< vals wc -l`
    cp vals vals_working
    while [[ $prog -lt $len ]]; do
      num=1
      len2=`< vals_working wc -l`
      while read val; do
        let "preq = num - 1"
        head -n$preq vals_working > others
        if [[ $num -ne $len ]]; then
          let "seq = len2 - num"
          tail -n$seq vals_working >> others
        fi
        success=1
        while read other; do
          grep -q "$other|$val" rules
          res=$?
          if [[ $res -eq 0 ]]; then
            success=0
            break
          fi
        done < others
        if [[ $success == 1 ]]; then
          break
        fi
        let "num = num + 1"
      done < vals_working
      if [[ $success == 1 ]]; then
        echo "$val" >> vals3
        cp others vals_working
      fi
      prog=`< vals3 wc -l`
    done
    len=`< vals3 wc -l`
    linenum=`echo "$len/2+1" | bc`
    line=`head -n$linenum vals3 | tail -n1`
    let "sum = sum + line"
  fi
done < orders
echo "$sum"

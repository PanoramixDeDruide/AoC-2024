#!/bin/bash

res=0
while read thing; do
thang=`echo "$thing" | bc`
let "res = res + thang"
done < input3
echo "$res"

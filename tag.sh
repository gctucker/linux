#!/bin/bash

set -e

px=kernelci-local-snapshot-
last_tag=$(git tag -l | grep $px | sort | tail -n 1)
n=$(echo $last_tag | awk '{print substr($0,25)}')
n="10#$n"
let 'n=n+1'
m=`printf "%03d" $n`
new_tag="$px""$m"
today=`date +%Y-%m-%d`
msg="KernelCI local snapshot #$m $today"
git tag -a "$new_tag" -m "$msg"
echo "$new_tag"

exit 0

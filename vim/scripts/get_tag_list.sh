#! /usr/bin/env zsh

filepath=$1
base=$2

results=$(grep -R $base $filepath | sed "s/^[^#]*\(#.*\)/\1/g" | tr " " "\n" | sort | uniq)
echo $results

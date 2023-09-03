#!/bin/zsh
number_of_packages=0

paru -Qu | while read line ; do
  number_of_packages=$((number_of_packages + 1))
done

if [ $number_of_packages = 0 ]; then
  echo "" 
else
  echo "$number_of_packages"
fi 

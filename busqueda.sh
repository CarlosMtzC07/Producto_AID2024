#!/bin/bash

path="/var/log/"
w="Carlos"


cd "$path"

for file in messages*
do
#       echo "$file"

        grep -Ril "$w" "$file"

	done

#!/bin/bash

path="/var/log/"
w="Karen_Martinez"


cd "$path"

for file in messages*
do
#       echo "$file"

        grep -Ril "$w" "$file"

done
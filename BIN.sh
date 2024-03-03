#!/bin/bash

path="/var/log/"
w="Karen_Martinez" #¿Por que tiene el nomnre de Karen?


cd "$path"

for file in messages*
do
#       echo "$file"

        grep -Ril "$w" "$file"

done
#! /bin/bash

path="/var/log/"
word="warning"

cd="$path"

for for file in
do 
#	echo "$file"
	cat "$file" | grep -i "word"

	done

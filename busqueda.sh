#!/bin/bash
#2
path="/var/log/"
word="warning"

cd "$path"

for file in *
do
#	echo "$file"
#	cat "$file" | grep -i "$word"
	grep -Ril "$word" "$file"
	done

#!/bin/bash

declare -a numeros=(1 2 3 4 5)
suma=0

for num in "${numeros[@]}"
do
	suma=$((suma+num))
	done
	echo "$suma"
	echo "${numeros[2-4]}"


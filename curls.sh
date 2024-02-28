#! /bin/bash

declare -a paginas('www.google.com')

for pagina in "$paginas[@]"
do 
	echo curl -s -l "$pagina"
	done

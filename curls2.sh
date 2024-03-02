#!/bin/bash
file=paginas.csv


for pagina in $(cat paginas)
do
	echo -e "$pagina \n"
		salida=$(curl -s -I "$pagina" | sed -n 'ip' | tail -1 | awk '{print $3"" $4}' | rev | cut -c3- | rev)
			if [ -z "$salida" ]
				then
						echo $pagina, "Fail">>$file
							else
									echo $pagina, "OK">>$file
										fi
										done

										column -s, -t $file

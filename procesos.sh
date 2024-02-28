#!/bin/bash
export LC_ALL=C bash

tHost="$(hostname)"
tTime="$(date +"%d/%m/%Y a las %H:%M:%S")"
tMemTotal="$(free -mh | grep "Mem:" | awk '{print $2}')"
tMemUsed="$(free -mh | grep "Mem:" | awk '{print $3}')"
tMemFree="$(free -mh | grep "Mem:" | awk '{print $4}')"
tLoadAverage="$(uptime | rev | cut -d ":" -f 1 | rev | cut -d " " -f 2-10)"
columna_CPU=57
columnas_total=$(tput cols)

# Si la terminal es grande lo ponemos en dos columnas, si no en una sola
if [ $columnas_total -gt 99 ]
    then
            fila_CPU=5
	        else
		        fila_CPU=19
			        columna_CPU=0
				fi

				tput clear # Borrado pantalla

				# Mostrar info 
				printf "\n$tHost - $tTime"
				printf "\nRAM: $tMemUsed usados de $tMemTotal totales ($tMemFree M libres)\nCarga media de la CPU: $tLoadAverage\n"

				# Mostrar procesos que consumen RAM
				echo -e "\n[+] Listado de Procesos top10 consumo de RAM:\n"
				# Encabezado
				ps -A --sort=-rss --format pid,user,pmem,rss,comm | head -n 1
				# Procesos
				tput setaf 1 # Rojo
				ps -A --sort=-rss --format pid,user,pmem,rss,comm | sed -n '2,6p'
				tput setaf 3 # Amarillo
				ps -A --sort=-rss --format pid,user,pmem,rss,comm | sed -n '7,9p'
				tput setaf 2 # Verde
				ps -A --sort=-rss --format pid,user,pmem,rss,comm | sed -n '10,11p'
				tput sgr0 # Volver al color normal

				# Columna CPU
				tput cup $fila_CPU $columna_CPU; echo -e "[+] Listado de Procesos top10 consumo CPU:\n"
				# Encabezado
				tput cup $(($fila_CPU + 2)) $columna_CPU; ps -A --sort=-pcpu --format pid,user,pcpu,rss,comm | head -n 1
				# Procesos
				tput setaf 1 # Rojo
				for (( i=2; i<=6; i++ ))
				do
				    tput cup $(($i + $fila_CPU + 1)) $columna_CPU; ps -A --sort=-pcpu --format pid,user,pcpu,rss,comm | sed -n "$i,$i p"
				    done
				    tput setaf 3 # Amarillo
				    for (( i=7; i<=9; i++ ))
				    do
				        tput cup $(($i + $fila_CPU + 1)) $columna_CPU; ps -A --sort=-pcpu --format pid,user,pcpu,rss,comm | sed -n "$i,$i p"
					done
					tput setaf 2 # Verde
					for (( i=10; i<=11; i++ ))
					do
					    tput cup $(($i + $fila_CPU + 1)) $columna_CPU; ps -A --sort=-pcpu --format pid,user,pcpu,rss,comm | sed -n "$i,$i p"
					    done
					    tput sgr0


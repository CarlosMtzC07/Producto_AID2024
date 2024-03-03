#!Bin/Bash
suma=$(awk-F ',''{sum+$21} END{print sum}'column -s,-t Accidentes_ags_2021.csv) #Faltoo separar el -F
echo "LA SUMA DE 'TRACTOR'ES: $suma"

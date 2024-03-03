#!/bin/bash
awk -F ',' '$45 =="CONSTITUCION" {print $1, $14}' Accidentes_ags_2021.csv #tu comando solo me muestra 2 resultados, son más los que arroja

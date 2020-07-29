#!/usr/bin/env bash

VAR="11"

if [ $VAR -gt 10 ]
then
  echo "É maior que 10."
  echo "pid: $$"
fi

echo "Resposta do professor."

[ $VAR -gt 10 ] && echo "Nome do Script: $0 | PID de execução: $$"

# Resposta do professor sobre o exercicio.
[[ "$VAR" > "10" ]] && echo "Nome do arquivo: $0" echo "PID: $$"

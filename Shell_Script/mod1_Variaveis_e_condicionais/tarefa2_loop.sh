#!/usr/bin/env bash

echo "Tarefa número 2 for"

for i in $(seq 0 10)
do
    if [[ $(($i % 2)) -eq 0 ]]; then
      echo "Número $i é divisível por 2"
    fi
done

for (( i = 0; i < 10; i++ )); do

  [ $(($i % 2)) -eq 0 ] && echo "Número $i é divisível por 2"

done

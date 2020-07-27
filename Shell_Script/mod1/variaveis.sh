#!/usr/bin/env bash

NOME="Ricardo Hatsugai"

echo "$NOME"

NUMERO_1=24
NUMERO_2=45

TOTAL=$(($NUMERO_1+$NUMERO_2))

echo "$TOTAL"

SAIDA_CAT=$(cat /etc/passwd | grep ricardo)

echo "$SAIDA_CAT"

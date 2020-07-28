#!/usr/bin/env bash

VAR="2"
VAR2="2"

if [[ "$VAR" = "$VAR2" ]]; then
  echo "São iguais."
fi

if [[ "$VAR" = "$VAR2" ]]
then
  echo "São iguais."
fi

if test "$VAR" = "$VAR2"
then
  echo "São iguais."
fi

if [ "$VAR" = "$VAR2" ]
then
  echo "São iguais."
fi

[ "$VAR" = "$VAR2" ] && echo "São Iguais."

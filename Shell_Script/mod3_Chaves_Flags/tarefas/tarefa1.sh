#!/usr/bin/env bash

# programa1.sh -abrir as opçẽos de acessórios mais rápido

#

# Site:       https://naotenho.com.br

# Autor:      Lucas

# Manutenção: Lucas

#

# ------------------------------------------------------------------------ #

# O programa vai mostrar as opções de acessórios e com apenas uma

# opção selecionará e abrirá o acessório escolhido

#

# Exemplos:

#      $ ./programa1.sh -c

#      abrirá a calculadora

# ------------------------------------------------------------------------ #

# Histórico:

#

#   v1.0 , :

#       - Início do programa

# ------------------------------------------------------------------------ #

# Testado em:

#   bash 4.4.19

# -----------------------------VARIAVEIS------------------------------------ #



MSG_USO="

  $0   - [OPÇÕES]

       -h -  Menu de ajuda

       -v - Versão do programa

       -c - Abrir calculadora

       -n - Nano

       -b - gnote

       -p - Python2.7

"

VERSAO="v1.0"

CHAVE_C=0

CHAVE_N=0

CHAVE_B=0

CHAVE_P=0





while test -n "$1"

do

case "$1" in



  -h) echo "$MSG_USO" && exit 0                               ;;

  -v) echo "$VERSAO" && exit 0                                ;;

  -c) CHAVE_C=1                                               ;;

  -n) CHAVE_N=1                                               ;;

  -b) CHAVE_B=1                                               ;;

  -p) CHAVE_P=1                                               ;;

  *) echo "Opção inválida, digite -h para ajuda" && exit 1    ;;

esac

  shift

done



[ $CHAVE_C -eq 1 ] && kcalc

[ $CHAVE_N -eq 1 ] && nano

[ $CHAVE_B -eq 1 ] && kate

[ $CHAVE_P -eq 1 ] && python2.7



echo "Obrigado por usar nosso programa!"

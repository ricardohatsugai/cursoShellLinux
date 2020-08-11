#!/usr/bin/env bash
#
# tarefa5.sh - Extrai nomes da lista entrada.dat, havendo a possibilidade de
#colocar em maiúsculo e ordem alfabética com função de debug
#
# Site:
# Autor: Alexandre Dias
# Manutenção: mantenedores
#
#------------------------------------------------------------#
# Explicar o que o programa faz
#
# Exemplos
# ./tarefa4.sh -s -m
# nesse exemplo ficará em maiusculo e em ordem alfabética
#
#------------------------------------------------------------#
# Historico:
#
#   v1.0 03/10/2018, Mateus:
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
LISTA="$(cat ./entrada.dat )"

MENSAGEM_USO="
  $(basename $0) - [OPÇÕES]

  -h - Menu de ajuda
  -d - Debug do Programa
  -v - Versão do programa
  -s - Ordenar saida
"

VERSAO="v1.0"
CHAVE_ORDENA=0
CHAVE_MAIUSCULO=0

CHAVE_DEBUG=0
NIVEL_DEBUG=0

COR1="\033[34;1;4m"
COR2="\033[31;1;5m"
COR3="\033[33;4;7m"
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #

Debugar () {
  [ $1 -le $NIVEL_DEBUG ] && echo -e  "${2}Debug $* -------"

}

# ------------------------------- EXECUÇÃO ----------------------------------------- #


while test -n "$1"
do
  case "$1" in
    -h) echo "$MENSAGEM_USO" && exit 0                               ;;
    -v) echo "$VERSAO" && exit 0                                     ;;
    -s) CHAVE_ORDENA=1                                               ;;
    -m) CHAVE_MAIUSCULO=1                                            ;;
    -d) [ $2 ] && NIVEL_DEBUG=$2                                     ;;
    *) #echo "Opção inválida, valide o -h, lista inicial"             ;;
  esac
  shift
done

Debugar 1 "$COR1" "Lista original: $LISTA"
[ $CHAVE_ORDENA -eq 1 ] && LISTA=$(echo "$LISTA" | sort)
Debugar 2 "$COR2" "Lista em ordem alfabética: $LISTA"
[ $CHAVE_MAIUSCULO -eq 1 ] && LISTA=$(echo "$LISTA" | tr [a-z] [A-Z])
Debugar 3 "$COR3"  "Lista com caracteres maiusculos: $LISTA"

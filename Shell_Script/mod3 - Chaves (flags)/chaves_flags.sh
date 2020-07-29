#!/usr/bin/env bash
#
# listaUsuarios.sh - Extrai usuários do /etc/passwd
#
# Site:       https://seusite.com.br
# Autor:      Ricardo Hatsugai
# Manutenção: Ricardo Hatsugai
#
# ------------------------------------------------------------------------ #
#  Irá extrair usuários do /etc/passwd, havendo a possibilidade de colocar
# em maiúsculo e em ordem alfabética.
#
#  Exemplos:
#      $ ./listausuarios.sh -s -m
#      Neste exemplo ficará em maiúsculo e em ordem alfabética.
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 28/07/2020, Ricardo:
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.0.3(1)-release Debian 10 Buster.
# ------------------------------- VARIÁVEIS ------------------------------ #
USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM_USO="
  $(basename $0) - [OPÇÕES]

    -h - Menu de ajuda
    -v - Versão
    -s - Ordenar a saída
    -m - Coloca em maiúsculo
"
VERSAO="v1.3"
CHAVE_ORDENA=0
CHAVE_MAIUSCULO=0
# ------------------------------------------------------------------------ #
#
# ------------------------------- EXECUÇÃO ------------------------------- #
while test -n "$1"
do
  case "$1" in
    -h) echo "$MENSAGEM_USO" && exit 0                  ;;
    -v) echo "$VERSAO" && exit 0                        ;;
    -s) CHAVE_ORDENA=1                                  ;;
    -m) CHAVE_MAIUSCULO=1                               ;;
     *) echo "Opção inválida, valide o -h." && exit 1   ;;
  esac
  shift
done

[ $CHAVE_ORDENA -eq 1 ]     && USUARIOS=$(echo "$USUARIOS" | sort)
[ $CHAVE_MAIUSCULO -eq 1 ]  && USUARIOS=$(echo "$USUARIOS" | tr [a-z] [A-Z])

echo "$USUARIOS"
# ------------------------------------------------------------------------ #

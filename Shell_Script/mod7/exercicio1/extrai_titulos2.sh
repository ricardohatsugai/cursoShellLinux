#!/usr/bin/env bash
#
# extrai_titulos2.sh - Extrai titulos de site
#
# Autor:      Ricardo Hatsugai
# Manutenção: Ricardo Hatsugai
#
# ------------------------------------------------------------------------ #
#  Este programa irá extrair títulos do site, colocar em um arquivo de
#  texto e ler mostrando com cores na tela.
#
#  Exemplos:
#      $ ./extrai_titulos2.sh
#      Neste exemplo o programa vai extrair os titulos e mostrar na tela.
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v0.1 23/08/2020, Mateus: Sistema de extração de dados do site.
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
ARQUIVO_DE_TITULOS="titulos2.txt"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -x "$(which lynx)" ] && sudo apt install lynx -y # Lynx instalado?
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
lynx -source http://www.starrett.com.br/ | grep blurb | sed 's/<li.*nome=//;s/<\/a.*//'


while read -r titulo_lxer
do
  echo -e "${VERMELHO}Titulo: ${VERDE}$titulo_lxer"
done < "$ARQUIVO_DE_TITULOS"
# ------------------------------------------------------------------------ #

#!/usr/bin/env bash
#
# sistema_de_usuarios.sh - Sistema para gerenciamento de usuários
#
# Autor:      Ricardo Hatsugai
# Manutenção: Ricardo Hatsugai
#
# ------------------------------------------------------------------------ #
#  Este programa faz todas as funções de gerenciamento de usuários, como:
#  inserir, deletar, alterar.
#
#  Exemplos:
#      $ source sistema_de_usuarios.sh
#      $ ListaUsuarios
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 06/10/2018, Mateus:
#       - Tratamento de erros com relação ao arquivo do banco de dados
#       - Lista usuários
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
ARQUIVO_BANCO_DE_DADOS="banco_de_dados.txt"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -e "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não existente." && exit 1
[ ! -r "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não tem permissão de leitura." && exit 1
[ ! -w "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não tem permissão de escrita." && exit 1
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #
ListaUsuarios () {
  while read -r linha
  do
    [ "$(echo $linha | cut -cl)" = "#" ] && continue
    [ ! "$linha" ] && continue

    local id="$(echo $linha | cut -d : -f 1)"
    local nome="$(echo $linha | cut -d : -f 2)"
    local email="$(echo $linha | cut -d : -f 3)"

    echo -e "${VERDE}ID: ${VERMELHO}$id"
    echo -e "${VERDE}Nome: ${VERMELHO}$nome"
    echo -e "${VERDE}E-mail: ${VERMELHO}$email"
  done < "$ARQUIVO_BANCO_DE_DADOS"
}
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #

# ------------------------------------------------------------------------ #

#!/usr/bin/env bash
#
# homeuser.sh - Extrai a home do ficheiro /etc/passwd
#
# Site:       https://github.com/ruidias10
# Autor:      Rui Dias
# Manutenção: Rui Dias
#
# ------------------------------------------------------------------------ #
#  Irá extrair a home do user do ficheiro /etc/passwd, com a possibilidade
#  ordenar a saida.
#
#  Exemplos:
#      $ ./homeuser -s
#      Neste exemplo a saida vai ser ordenada
#      $ ./homeuser -p root
#      Neste exemplo vai deveolver a Home do user root
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 28/01/2018, Rui Dias:
#     - Inicio do projeto
#   v1.1 30/01/2018, Rui Dias:
#     - Adiciona opção de debug
# ------------------------------------------------------------------------ #
# Testado em:
#   zsh 5.3
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
MENSAGEM_USO="
  $(basename $0) - [OPÇÕES]

      -h - Menu de ajuda
      -v - Versão do programa
      -s - Ordernar a saída
      -p - Pesquisar por nome de utilizador
      -d - Modo Debug
"
VERSAO="v1.1"
ORDENA=0
PESQUISA=":"
NIVEL_DEBUG=1
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #

DEBUG() {
  [ $1 -le $NIVEL_DEBUG ] && echo " - Debug $*"
}

while test -n "$1"
do
  case "$1" in
    -h) echo "$MENSAGEM_USO" && exit 0               ;;
    -v) echo "$VERSAO" && exit 0                     ;;
    -s) ORDENA=1                                     ;;
    -d) [[ $2 ]] && NIVEL_DEBUG="$2" && shift        ;;
    -p) [[ $2 ]] && PESQUISA="$2" && shift           ;;
     *) echo "Parametro Invalido!" && exit 0         ;;
  esac
  shift
done


if [[ $ORDENA -eq 1 ]]
then
  COMANDO="$(cat /etc/passwd | grep : | sort | cut -d : -f 1 -f 6)"
else
  COMANDO="$(cat /etc/passwd | grep "$PESQUISA" | sort | cut -d : -f 1 -f 6)"
fi


for l in ${COMANDO[*]}
do
  NOME=$(echo $l | cut -d : -f 1)
  DEBUG 1 "NOME: $NOME"
  HOME=$(echo $l | cut -d : -f 2)
  DEBUG 2 "HOME: $HOME"
  echo -e "\x1B[01;96m$NOME: \x1B[0m $HOME"
done

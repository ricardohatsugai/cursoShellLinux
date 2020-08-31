#!/usr/bin/env bash

#

#  9.sh - Mostra as versões do Bash e do Zsh

#

#  Autor: Diovani Dal'Moro

#

# -------------------------------------------------------------------------------------------------

#

#  Retorna as versões do Bash e do Zsh

#

#  Exemplos:

#

#    $ ./9.sh -z

#      Retorna a versão do Zsh

#

#    $ ./9.sh -b

#      Retorna a versão do Bash

#

# -------------------------------------------------------------------------------------------------

#

#  Historico:

#

#    v1.0 22/11/2019, Diovani Dal'Moro

#      - Primeira versão do programa

#

# -------------------------------------------------------------------------------------------------

#

#  Testado em:

#

#    Bash 5.0.3

#    Zsh  5.7.1

#

# -------------------------------------------------------------------------------------------------



BASENAME="$( basename $0 )"



RED="\033[31;1m"

CLEAR="\033[m"



VERSION="$BASENAME v1.0"

HELP="

  $BASENAME - [ OPÇÕES ]



    -h      Mostra a ajuda

    -v      Mostra a versão do programa

    -b      Mostra a versão do Bash

    -z      Mostra a versão do Zsh

"



BashInfo() {

  [ ! -x "$( which bash )" ] && echo "${RED} Você não possui o Bash instalado!${CLEAR}" && exit 1

  local bash_version="$( bash --version | grep 'bash' | awk '{ print $4 }' | sed 's/(.*$//' )"



  echo "A versão Bash é: $bash_version"

}



ZshInfo() {

  [ ! -x "$( which zsh )" ]  && echo "${RED} Você não possui o Zsh instalado!${CLEAR}"

  local zsh_version="$( zsh --version bash --version | awk '{ print $2 }' )"



  echo "A versão do Zsh é: $zsh_version"

}



while test -n "$1"; do

  case "$1" in

    -h) echo "$HELP"    && exit 0;;

    -v) echo "$VERSION" && exit 0;;

    -z) ZshInfo                  ;;

    -b) BashInfo                 ;;

     *) DEFAULT=1                ;;

   esac



   shift

done



[ "$DEFAULT" = "" ] && echo "$HELP" && exit 1 || echo "O parametro solicitado não existe! Digite ./$BASENAME -h"

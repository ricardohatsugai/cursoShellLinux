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
SEP=:
TEMP=temp.$$
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -e "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não existente." && exit l
[ ! -r "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não tem permissão de leitura." && exit 1
[ ! -w "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não tem permissão de escrita." && exit 1
[ ! -x "$(which dialog)" ] && sudo apt install dialog 1> /dev/null 2>&1
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #
ListaUsuarios () {
  egrep -v "^#|^$" banco_de_dados.txt | tr : ' ' > "$TEMP"
  dialog --title "Lista de Usuários" --textbox "$TEMP" 20 40
  rm -f "$TEMP"
}

ValidaExistenciaUsuario () {
  grep -i -q "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS"
}

InsereUsuario () {
  local ultimo_id="$(egrep -v "^#|^$" banco_de_dados.txt | sort | tail -n 1 | cut -d $SEP  -f 1)"
  local proximo_id=$(($ultimo_id+1))

  local nome=$(dialog --title "Cadastro de Usuários" --stdout --inputbox "Digite o seu nome" 0 0)
  ValidaExistenciaUsuario "$nome" && {
    dialog --title "ERRO FATAL!" --msbox "Usuário já cadastrado no sistema!" 6 40
    exit 1
  }

  local email=$(dialog --title "Cadastro de Usuário" --stdout --inputbox "Digite o seu E-Mail" 0 0)

  echo "$proximo_id$SEP$nome$SEP$email" >> "$ARQUIVO_BANCO_DE_DADOS"
  dialog --title "Sucesso!" --msgbox "usuário cadastrado com sucesso!" 6 40

  ListaUsuarios
}

ApagaUsuario () {
  ValidaExistenciaUsuario "$1" || return

  grep -i -v "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
  mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"

  echo "Usuário removido com sucesso!"
}

OrdenaLista () {
  sort "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
  mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"
}

RemoverUsuario () {
  local usuarios=$(egrep "^#|^$" -v "$ARQUIVO_BANCO_DE_DADOS" | sort -h | cut -d $SEP -f 1,2 | sed 's/:/ "/;s/$/"/')
  local id_usuario=$(dialog --stdout --menu "Escolha um usuário:" 0 0 0 $usuarios)

  grep -i -v "^$id_usuario$SEP" "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
  mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"

  dialog -- msgbox "Usuário removido com sucesso!"
  ListaUsuarios
}
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
while :
do
  acao=$(dialog --title "Gerenciamento de Usuários 2.0" \
                --stdout \
                --menu "Escolha uma das opções abaixo:" \
                0 0 0 \
                listar "Listar todos os usuários do sistema" \
                remover "Remover um usuário do sistema" \
                inserir "Inserir um novo usuário no sistema")

  case $acao in
    listar) ListaUsuarios ;;
    inserir) InsereUsuario ;;
    remover) RemoverUsuario ;;
  esac
done
# ------------------------------------------------------------------------ #

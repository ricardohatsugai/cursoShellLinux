#!/usr/bin/env bash

#

# Listar_notas.sh - Programa para controle de alunos e notas de uma turma.

# Autor:      Daniel Noronha

# Manutenção: Daniel Noronha

#

#----------------------------------------------------------------------------#

# Este programa irá realizar uma consulta ou alteração em uma lista de alunos

# de acordo com as opções escolhidas no arquivo de configuração.

# Nome do arquivo de configuração: arq_config.cf

#

# Informações do arquivo:

#   0 desativado, 1 ativado

#   Escolher apenas uma opção para ficar ativo.

#   LISTAR_ALUNOS=0

#   LISTAR_NOTAS=0

#   QUANT_ALUNOS=0

#   INSERIR_ALUNOS=0

#   PESQUISAR_ALUNOS=0

#

# Necessário apenas ativar uma opção informando o '1'.

#----------------------------------------------------------------------------#

# Histórico:

# v1.0 06/03/2019, Daniel:

#   - Início do programa

# v1.1 06/03/2019, Daniel:

#   - Adicionando opção de enumeração de linha

# v1.2 06/03/2019, Daniel:

#   - Adicionando a opção de pesquisar alunos nota 10

# v2.0 07/03/2019, Daniel:

#   - Utilizando a mesma estrutura da versão 1

#   - Adicionando o modo de pesquisa por nome de aluno

# V2.1 10/03/2019, Daniel:

#   - Adicionando a opçao de debug

# V3.0 10/03/2019, Daniel:

#   - Corrigindo a função debug

#   - Reduzindo a quantidade de linhas no programa

#   - Retirando algumas váriaveis que não serão utilizados como era nas versões anteriores

#   - Retirando as opções de testes que havia nas versões anteriores

# V3.1 11/03/2019, Daniel:

#   - Adicionando cores ao programa

# V3.2 12/03/2019, Daniel:

#   - Removendo opção de menu de ajuda, versão e debug

# V3.3 13/03/2019, Daniel:

#   - Removendo opção de ordenar a saída, colocar em maiúsculo e listar notas 10

# V3.4 14/03/2019, Daniel:

#   - Removendo menu interativo

# V4.0 15/03/2019, Daniel:

#   - Adicionando arquivo de configuração

#   - Alterando o programa para responder de acordo com as opções do arquivo de configuração

#   - Corrigindo as falhas nos Parametro de execução para executar junto ao arquivo de configuração

# V4.1 16/03/2019, Daniel:

#   - Adicionando mais cores ao Programa

#   - Iniciando a interação com o parser

#----------------------------------------------------------------------------#

# Testado em:

#   bash 4.4.23

#   bash 4.4.19

#   zsh  5.4.2

#----------------------------------------------------------------------------#

#--------------------------------VARIÁVEIS-----------------------------------#

ARQUIVO_DE_CONFIGURACAO="arq_config.cf"

LISTA_DOS_ALUNOS="Lista_alunos.txt"

LISTAR_ALUNOS=

LISTAR_NOTAS=

QUANT_ALUNOS=

INSERIR_ALUNOS=

PESQUISAR_ALUNOS=

ALUNOS="$(cat /home/lpi1/Documents/ExerciciosShell/Scripts/Script_conf/Lista_alunos.txt)"

VERDE="\033[32;1m"

VERMELHO="\033[31;5m"

ROXO="\033[35;1m"

AMARELO="\033[33;1m"

CIANO="\033[36;1m"

MENSAGEM="${VERMELHO}Nenhuma opção escolhida! \033[0m

${CIANO}Escolha uma opção no arquivo de configuração."

#----------------------------------------------------------------------------#

#--------------------------------TESTES--------------------------------------#

[ ! -r "$ARQUIVO_DE_CONFIGURACAO" ] && echo -e "${VERMELHO}Não temos acesso de leitura \033[0m" && exit 1

#----------------------------------------------------------------------------#

#--------------------------------FUNÇÕES-------------------------------------#

DefinirParametros () {

  local parametro="$(echo $1 | cut -d = -f 1)"

  local valor="$(echo $1 | cut -d = -f 2)"



case "$parametro" in

    LISTAR_ALUNOS)    LISTAR_ALUNOS=$valor    ;;

    LISTAR_NOTAS)     LISTAR_NOTAS=$valor     ;;

    QUANT_ALUNOS)     QUANT_ALUNOS=$valor     ;;

    INSERIR_ALUNOS)   INSERIR_ALUNOS=$valor   ;;

    PESQUISAR_ALUNOS) PESQUISAR_ALUNOS=$valor ;;

esac

}

#--------------------------------EXECUÇÃO-----------------------------------#

while read -r linha

do

  [ "$(echo $linha | cut -c1)" = "#" ] && continue

  [ ! "$linha" ] && continue

  DefinirParametros "$linha"

done < "$ARQUIVO_DE_CONFIGURACAO"



[ $LISTAR_ALUNOS -eq 1 ]    && echo -e "${VERDE}$ALUNOS \033[0m" | cut -d = -f 1 && exit 0

[ $LISTAR_NOTAS -eq 1 ]     && echo -e "${VERDE}$ALUNOS \033[0m" && exit 0

[ $QUANT_ALUNOS -eq 1 ]     && echo -e "${VERDE}$ALUNOS \033[0m" | wc -l && exit 0

[ $INSERIR_ALUNOS -eq 1 ]   && echo -e "${AMARELO}Informação!! ${CIANO}Digite o nome com underline '_', Ex.: Nome_Sobrenome \033[0m" && echo -e "${ROXO}Nome do aluno? \033[0m" && read -r nome1 && echo -e "${ROXO}Nota do aluno \033[0m" && read -r nota1 && echo "$nome1=$nota1" >> "$LISTA_DOS_ALUNOS" && exit 0

[ $PESQUISAR_ALUNOS -eq 1 ] && echo -e "${ROXO}Qual o nome do aluno? \033[0m" && read -r list1 && echo -e "${CIANO}$ALUNOS \033[0m" | grep $list1 && exit 0



echo -e "$MENSAGEM"

#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#

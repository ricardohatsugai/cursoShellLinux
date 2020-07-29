#!/usr/bin/env bash
#
# nomeDoScript.sh - Breve descrição
#
# Site:       https://seusite.com.br
# Autor:      Seu nome
# Manutenção: Seu nome ou outro
#
# ------------------------------------------------------------------------ #
#  Aqui você deve utilizar uma descrição mais detalhada sobre o seu programa,
#  explicando a forma de utilizar.
#
#  Exemplos:
#      $ ./nomeDoScript.sh -d 1
#      Neste exemplo o script será executado no modo debug nível 1.
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 18/08/2018, Autor da mudança:
#       - O que mudou?
#   v1.1 19/08/2018, Autor da mudança:
#       - O que mudou?
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #
# Agradecimentos:
#
# Joãozinho - Encontrou um bug na parte de login.
#	Mariazinha - Enviou uma sugestão de adicionar o -h.
# ------------------------------------------------------------------------ #
# ------------------------------- VARIÁVEIS ----------------------------------------- #
COMEC0=0 # Número inicial
FIM=100 # Vai até?
# ------------------------------------------------------------------------ #
# ------------------------------- TESTES ----------------------------------------- #
# Começo maior que o fim? Inválido!
[ $COMECO -ge $FIM ] && exit 1
# ------------------------------------------------------------------------ #
# ------------------------------- EXECUÇÃO ----------------------------------------- #
for i in $(seq $COMECO $FIM) # Repete 100 vezes
do
for j in $(seq $i $FIM) # Repete de N vezes até 100 vezes
do
printf "*"
done
printf "\n" # Quebra linha
done
# ------------------------------------------------------------------------ #

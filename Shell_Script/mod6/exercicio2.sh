#!/usr/bin/env bash
# Envie a saída do comando acima para o comando grep (use o PIPE "|") e faça
# as seguintes expressões regulares:

cut -d : -f 1 /etc/group | egrep "^r"

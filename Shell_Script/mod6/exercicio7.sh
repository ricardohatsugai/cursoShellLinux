#!/usr/bin/env bash
#
# Grupos que tenham seu nome de 2 a 4 dígitos de tamanho:
cut -d : -f 1 /etc/group | egrep "^.{2,4}$"

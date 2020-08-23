#!/usr/bin/env bash
#
# Grupos que não terminam com a letra "e" ou "d":
#
cut -d : -f 1 /etc/group | egrep "^.[^ed]"

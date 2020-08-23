#!/usr/bin/env bash
#
# Grupos que terminem com a letra "e"
#
cut -d : -f 1 /etc/group | egrep "^.[ed]"

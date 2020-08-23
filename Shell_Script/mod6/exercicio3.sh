#!/usr/bin/env bash
#
# Grupos que terminem com a letra "t"
# 
cut -d : -f 1 /etc/group | egrep "^.*t$"

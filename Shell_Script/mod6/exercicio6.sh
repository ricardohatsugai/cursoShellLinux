#!/usr/bin/env bash
#
# Grupos que começam com qualquer dígito e a segunda letra seja um "u" ou "d":
#
cut -d : -f 1 /etc/group | egrep "^.[ud]"

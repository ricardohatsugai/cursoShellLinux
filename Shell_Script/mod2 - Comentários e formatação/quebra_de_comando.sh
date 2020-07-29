#!/usr/bin/env bash

find /  -iname "*.so"  \
        -user ricardo  \
        -type f        \
        -size +1M      \
        -exec ls {}    \;

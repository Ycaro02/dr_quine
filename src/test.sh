#!/bin/bash

NAME=test_${1}

clang -Wall -Wextra -Werror -o ${NAME} ${1}.c; ./${NAME} > .tmp${1} ; diff .tmp${1} ${1}.c && echo Diff ok

rm .tmp${1} ${NAME};
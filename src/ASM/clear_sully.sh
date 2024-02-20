#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"

NAME=Sully_
EXT=.${1}
MAX=5

for (( i=0; i<=$MAX; i++ ))
do
    NB=${i}
    NEW_NAME=${NAME}${NB}${EXT}
    if [ -f ${NEW_NAME} ]
    then
        echo -e "${YELLOW} rm ${NEW_NAME} ${RESET}" && rm ${NEW_NAME}
    fi
    NEW_NAME=${NAME}${NB}
    if [ -f ${NEW_NAME} ]
    then
        echo -e "${YELLOW} rm ${NEW_NAME} ${RESET}" && rm ${NEW_NAME}
    fi

done
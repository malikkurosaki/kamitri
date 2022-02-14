#!/usr/bin/env bash

$w1=$(tput setaf 2)
$w2=$(tput setaf 3)
$w3=$(tput setaf 7)

pertama() {
    git init
    git add .
    git commit -m "pertama"
    git branch -M main
    git remote add origin https://github.com/malikkurosaki/kamitri.git
    git push -u origin main
    cd xsvr
    npm init -y
    npm i express express-async-handler cors @prisma/client
    touch svr.js
}

menu() {
    local m="
    ------------------------------------------
    KAMITRI                               MENU
    ------------------------------------------




    ------------------------------------------
    Malikkurosaki@2022                    v001
    "
}

perintah() {
    case $1 in
    pertama) pertama ;;
    *) menu ;;
    esac
}

[[ ! -z $1 ]] && perintah $1 || menu

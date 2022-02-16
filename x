#!/usr/bin/env bash

w1=$(tput setaf 2)
w2=$(tput setaf 3)
w3=$(tput setaf 7)
tm=$(date +"%y-%m-%d %T")

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
    flutter build web --release
}

menu() {
    local m="
    KAMITRI                               MENU

    pertama        menjalankan perintah pertama install
    run 
        -s         run server
        -c         run client

    pertama
    pub
    mig
    seed
    build


    Malikkurosaki@2022                    v001
    "

    echo "$m"
}

run() {
    case $1 in
    -s)
        cd xsvr
        nodemon svr.js
        ;;
    -c) flutter run -d chrome --web-renderer html ;;
    *) menu ;;
    esac
}

pub() {
    flutter pub add get
    flutter pub add get_storage
    flutter pub add flutter_easyloading
    flutter pub add flutter_native_splash
}

push() {
    git add .
    git commit -m "$tm"
    git push origin main

}

mig() {
    cd xsvr &&
        prisma migrate dev --name "$tm" &&
        prisma generate
}

seed() {
    cd xsvr && node seed.js
}

build() {
    flutter build web --release
}

perintah() {
    case $1 in
    pertama) pertama ;;
    run) run $2 ;;
    pub) pub ;;
    mig) mig ;;
    seed) seed ;;
    build) build ;;
    push) push ;;
    *) menu ;;
    esac
}

[[ ! -z $1 ]] && perintah $1 $2 || menu

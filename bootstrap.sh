#!/bin/bash

CWD=$(dirname "$0")
THEME="$HOME/.spm/themes/arale"
JSC="https://raw.github.com/lepture/nico/master/scripts/node-jscoverage.rb"

cd $CWD

if [ ! -d $THEME ]; then
    echo "clone nico arale theme"
    git clone https://github.com/aralejs/nico-arale.git $THEME
else
    echo "update nico arale theme"
    cd $THEME
    git pull origin master
    cd $CWD
fi

if ! which jscoverage > /dev/null; then
    echo "install jscoverage"

    git clone https://github.com/visionmedia/node-jscoverage.git .jscoverage
    cd .jscoverage
    ./configure --prefix=/usr/local
    make
    make install
    cd $CWD
    rm -fr .jscoverage
else
    echo "you have installed jscoverage"
fi

if ! which jade > /dev/null; then
    echo "install jade"
    npm install jade -g
else
    echo "you have installed jade"
fi

if ! which mocha > /dev/null; then
    echo "install mocha"
    npm install mocha -g
else
    echo "you have installed mocha"
fi


if ! which mocha-phantomjs > /dev/null; then
    echo "install mocha phantomjs"
    npm install mocha-phantomjs -g
else
    echo "you have installed mocha-phantomjs"
fi

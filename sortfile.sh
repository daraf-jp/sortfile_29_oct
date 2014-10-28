#! /bin/sh
# @(#) このプログラムは議事録を整理するためのプログラムです。

if [ -d sorted_gijiroku ]; then
  echo 'sorted_gijirokuフォルダはすでに存在します。'
else
  mkdir sorted_gijiroku
fi

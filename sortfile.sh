#! /bin/sh
# @(#) このプログラムは議事録を整理するためのプログラムです。

SORTEDDIR=sorted_gijiroku

if [ -d $SORTEDDIR ]; then
  echo "$SORTEDDIR フォルダはすでに存在します。"
else
  mkdir $SORTEDDIR
fi

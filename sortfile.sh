#! /bin/sh
# @(#) このプログラムは議事録を整理するためのプログラムです。

SORTEDDIR=sorted_gijiroku
LOGDIR=gijiroku

if [ -d $SORTEDDIR ]; then
  echo "$SORTEDDIR フォルダはすでに存在します。"
else
  mkdir $SORTEDDIR
fi

files=(`find $LOGDIR -name "*.log"`)

for file in ${files[@]}
do
  echo `basename $file`
done

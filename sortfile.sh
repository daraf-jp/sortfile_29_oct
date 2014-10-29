#! /bin/sh
# @(#) このプログラムは議事録を整理するためのプログラムです。

SORTEDDIR=sorted_gijiroku
LOGDIR=gijiroku
ALLDIR="$SORTEDDIR/all"
NOTALLDIR="$SORTEDDIR/notall"

if [ -d $SORTEDDIR ]; then
  echo "$SORTEDDIR フォルダはすでに存在します。"
else
  mkdir $SORTEDDIR
  mkdir $ALLDIR
  mkdir $NOTALLDIR
fi

files=(`find $LOGDIR -name "*.log"`)

for file in ${files[@]}
do
  if [ `basename $file` = "*_all.log" ]; then
    echo `basename $file`
  fi
done

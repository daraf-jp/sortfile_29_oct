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
  if echo `basename $file` | grep -q _all.log; then
    cp $file $ALLDIR
  else
    cp $file $NOTALLDIR
  fi
done

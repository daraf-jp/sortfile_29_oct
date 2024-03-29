#! /bin/sh
# @(#) このプログラムは議事録を整理するためのプログラムです。

SORTEDDIR=sorted_gijiroku
LOGDIR=gijiroku
ALLDIR="$SORTEDDIR/all"
KAIHATSUDIR="$SORTEDDIR/kaihatsu"
EIGYODIR="$SORTEDDIR/eigyo"

if [ -d $SORTEDDIR ]; then
  echo "$SORTEDDIR フォルダはすでに存在します。"
else
  mkdir $SORTEDDIR
  mkdir $ALLDIR
  mkdir $KAIHATSUDIR
  mkdir $EIGYODIR
fi

files=(`find $LOGDIR -name "*.log"`)

for file in ${files[@]}
do
  if echo `basename $file` | grep -q _all.log; then
    cp $file $ALLDIR
  else
    user=`expr \`basename $file\` : "^\(.*\)_[0-9][0-9][0-9][0-9].*"`
    case $user in
      taro) cp $file $KAIHATSUDIR ;;
      jiro) cp $file $EIGYODIR ;;
      saburo) cp $file $KAIHATSUDIR ;;
    esac
  fi
done

files=(`find $ALLDIR -name "*.log"`)

for file in ${files[@]}
do
  new_file=`expr $file : ".*\([0-9][0-9][0-9][0-9]_[0-9][0-9]_[0-9][0-9]\).*"`.log
  user=`expr \`basename $file\` : "^\(.*\)_[0-9][0-9][0-9][0-9].*"`
  echo "作成者：$user" >> $file
  cat $file >> $ALLDIR/$new_file
done

rm `find $ALLDIR -name "*_all.log"`

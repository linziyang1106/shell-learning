#!/bin/bash

# 产生10个随机数
for i in {0..9}
do
    echo $RANDOM
done

# for
for ((i=1; i<=5; i++))
do
    echo $i
done

# while
int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done

# while读取键盘信息
echo '按下 <CTRL-D> 退出'
echo -n '输入你最喜欢的电影: '
while read FILM
do
    echo "是的！$FILM 是一个好电影"
done

# 无限循环
# while true
# do
#     command
# done

# for((;;))
# do 
#   命令
# done
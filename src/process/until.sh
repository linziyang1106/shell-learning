#!/bin/bash
read -p "请输入一个循环数字：" num
i=0

# 当条件为false时执行
until [[ ! $i < $num ]]
do
    let i++
    echo "hello${i}"
done
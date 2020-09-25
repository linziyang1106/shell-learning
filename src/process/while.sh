#!/bin/bash
read -p "请输入一个循环数字：" num
i=0
while ((i<num))
do
    echo "hello${i}"
    let i++
done
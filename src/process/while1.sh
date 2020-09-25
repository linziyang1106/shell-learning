#!/bin/bash
read -p "请输入一个循环数字：" num
i=0
while ((i<num))
do
    let i++
    if ((i==3))
    then
        echo "进入下一次循环"
        continue;
    fi
    echo "hello${i}"
done
#!/bin/bash

# select 是无限循环

echo "你的爱好是什么："
select hobby in "编程" "游戏" "篮球" "游泳"
do
    echo "$hobby"
    break
done
echo "你的爱好是：${hobby}"
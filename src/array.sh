#!/bin/bash
# 数组用空格隔开
array1=(1 2 3)
array2=(28 23 "codelin" )
# 可以直接索引赋值

# 获取数组中所有元素
echo ${array1[*]}

# 获取数组的长度或个数
echo ${#array1[*]}

array3=(${array1[*]} ${array2[*]})

echo ${array3[*]}
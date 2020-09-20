#!/bin/bash

# 获取输入参数的个数
echo ${#}

echo '使用$*直接输出'${*}
echo '使用$@直接输出'${@}

echo '循环遍历输出$*所有参数'
for item in "$*"
do
    echo ${item}
done

echo '循环遍历输出$@所有参数'
for item in "$@"
do
    echo ${item}
done


#!/bin/bash
# 设置age为整型

# 设置数组
declare -a age

declare -i age=20

# 取消age整型的限制
declare +i age

age="abc"
echo $age

# 设置age为只读
declare -r age

# 实现关联数组变量语法

declare -A person=(["姓名"]="林子洋" ["年龄"]=9 ["爱好"]="羽毛球")
echo ${person["姓名"]}
echo ${person[*]}

# 创建索引数组
declare -a array1=(100 abc "lzy")
echo ${array1[0]}
echo ${array1[*]}
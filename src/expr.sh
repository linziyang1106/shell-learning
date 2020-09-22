#!/bin/bash
expr 1 + 1

# expr只对整数运算
# 反引号可以执行引号的内容
result=`expr 1 + 5`
echo ${result}


a=1 b=2          
# 声明变量a=1和b=2
echo "a=${a} b=${b}"
echo "a + b = `expr $a + $b`"
echo "a * b = `expr $a \* $b`"
echo "a - b = `expr $a - $b`"
echo "a * b = `expr $a \* $b`"
echo "b / a = `expr $b / $a`"
echo "b % a = `expr $b % $a`"

echo `expr \( 1 + 1 \) \* 2`
#!/bin/bash

# 有返回值的函数

fun(){
    echo "输入第一个数字"
    read num1
    echo "输入第二个数字"
    read num2
    return $((${num1}+${num2}))
}

fun
echo "结果为 $?"
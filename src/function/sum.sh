#!/bin/bash
sum()
{
    read -p "输入第一个数字：" num1
    read -p "输入第二个数字：" num2
    echo "两个数字分别是 $num1 和 $num2"
    return $(($num1+$num2))
}
sum
echo "两个数字的和为 ：$?"

# Shell程序命令：运行命令时开启一个子进程运行命令
# 函数：在当前Shell环境中运行，没有开启进程
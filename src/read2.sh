#!/bin/bash
# 提示信息，您确定要删除数据么？(请输入y/n)，
# 并且设置读取一个字符，
# -n是设置读取几个字符
read -p "您确定要删除数据么？(请输入y/n):" -n 1 char
# 打印这个字符并输出
printf "\n" # 也可以使用一个echo代替
echo "您输入的字符：${char}"
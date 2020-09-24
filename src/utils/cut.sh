#!/bin/bash

# 提取第一列
# 以空格分割
cut cut1.txt -d " " -f 1

# 提取第一列和第三列
cut cut1.txt -d " " -f 1,3

# 提取第二列以后的数据
cut cut1.txt -d " " -f 2-

# 提取第四列以前的数据
cut cut1.txt -d " " -f -4

# 提取第二列到第四列的数据
cut cut1.txt -d " " -f 2-4

# 提取前两个字符
cut cut1.txt -c 1-2

echo "abc传智播客" | cut -nb -4
#  -n 取消多字节字符分割直接输出
#!/bin/bash
your_name='runoob'
str='Hello, I know you are'
# 定义字符串中，单引号只能成对出现
echo -e $str
# 获取字符串长度
echo ${#str}
# 获取参数

echo $$

echo ${str:0:2}

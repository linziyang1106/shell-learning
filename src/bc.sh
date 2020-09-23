#!/bin/bash

# 直接输出结果
echo "1+1" | bc -l
# 赋值给变量
a=$(echo "1+1" |bc -l)

b=`bc << EOF
1+1
2+2
EOF
`
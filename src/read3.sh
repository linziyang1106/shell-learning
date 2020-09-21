#!/bin/bash
# 使用read命令读取数据，要有提示信息“请输入密码(20秒内)”：并设置限制时间为20s
# s是静默模式
read -t 20 -sp "请输入密码(20秒内):" pwd1
echo
read -t 20 -sp "请再次输入密码(20秒内):" pwd2
echo
# 校验密码是否一致
if [ ${pwd1} == ${pwd2} ]
then
    echo "密码与确认密码一致，验证通过"
else
    echo "密码与确认密码不一致，验证失败"
fi
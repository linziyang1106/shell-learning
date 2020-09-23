#!bin/bash
#author:amau

var="http://www.runoob.com/linux/linux-shell-variable.html"
#h
s1=${var%%t*}
#http://www.runoob.com/linux/linux-shell-variable.h
s2=${var%t*}
#http://www
s3=${var%%.*}
#/www.runoob.com/linux/linux-shell-variable.html
s4=${var#*/}
#linux-shell-variable.html
s5=${var##*/}

echo $s1
echo $s2
echo $s3
echo $s4
echo $s5
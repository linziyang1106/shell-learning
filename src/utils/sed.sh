#!/bin/bash

# 向文件中添加数据
# 在第三行后面添加数据（只是预览，并没有修改源文件）
sed '3ahello' sed.txt

# 修改源文件
sed -i '3ahello' sed.txt

# 在第三行前面插入文件
sed '3ihello' sed.txt

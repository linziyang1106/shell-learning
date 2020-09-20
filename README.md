# shell入门

## 脚本文件的常用执行方式

### 介绍

1. sh解析器执行

   语法：`sh 脚本文件`

2. bash解析器执行，语法与sh类似

3. 仅路径执行方式

   语法：`./脚本文件`

   注意：需要有执行权限

   可使用`chmod a+x 脚本文件`给对应的脚本文件添加执行权限

前两者是直接使用shell解析器运行脚本文件，不需要可执行权限

## 环境变量

`env`命令查看系统环境变量

`set`命令查看函数和系统变量+自定义变量

1. PATH 查看系统环境变量，以分号分隔
![mark](http://img.codelin.xyz/blog/20200920/RdPTgOR1506E.jpg?imageslim)
2. LANG 设置当前系统语言环境
3. HISTFILE 查询当前用户执行命令的历史列表

## 自定义变量
就是自己定义的变量

### 分类
1. 自定义局部变量
2. 自定义常量
3. 自定义全局变量

### 自定义局部变量
就是定义在一个脚本文件中的变量，只能在这个脚本文件中使用的变量

#### 定义与语法
```bash
var_name=value
```

规则：

1.变量名可以有字母，数字和下划线组成，不能以数字开头
2. 等号两侧不能有空格
3. 在bash环境中，变量的默认类型都是字符串类型，无法直接进行数值运算
4. 变量的值如果有空格，必须使用双引号括起来
5. 不能使用shell的关键字作为变量名称 

查询变量值语法
```bash
# 语法1：直接使用变量名查询
$var_name
# 语法2：使用花括号
${var_name}
# 区别：花括号方式适合拼接字符串
```
![mark](http://img.codelin.xyz/blog/20200920/uK3rJTYGyjME.png?imageslim)

删除变量
```bash
unset var_name
```

### 自定义常量
> 就是变量设置值以后不可以修改的变量，也叫只读变量

#### 语法
```bash
readonly var_name
```

### 自定义全局变量

#### 父子Shell环境介绍

例如：有2个Shell脚本文件 A.sh和B.sh
如果在A.sh脚本文件中执行了B.sh，那么A.sh就是夫Shell环境，B.sh就是子Shell环境

#### 自定义全局变量介绍
> 就是在当前脚本文件中定义全局变量，这个全局变量可以在当前Shell环境与子Shell环境中都可以使用

#### 语法
```bash
export var_name1 var_name2=value
# 可以同时定义多个，也可以直接赋值
```

#### 案例
测试全局变量在子Shell中是否可用，在父Shell中是否可用

#### 实现步骤
1. 创建2个脚本文件demo2.sh和demo3.sh
2. 编辑demo2.sh
   
   命令1：定义全局变量VAR4

   命令2：执行demo3.sh脚本文件

3. 编辑demo3.sh

   输出全局变量VAR4

4. 执行demo2.sh脚本文件


### 特殊变量

#### $n

语法


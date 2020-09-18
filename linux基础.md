## Linux文件基本属性

修改文件或目录的所属用户与权限

- chown (change ownerp) ： 修改所属用户与组。
- chmod (change mode) ： 修改用户的权限。

使用`ll`命令可以显示文件的属性及其文件所属的用户和组

![ll查看文件](http://img.codelin.xyz/20200917195140.png)

属主前的1表示的是硬链接的个数

![](https://www.runoob.com/wp-content/uploads/2014/06/363003_1227493859FdXT.png)

`d`代表目录，`-`代表文件，`l`代表链接，权限的顺序都一致且都存在，无则用`-`表示

### Linux文件属主和属组

上图文件所属主和属组都是root用户

### 更改文件属性

1. `chgrp`：更改文件属组

   ```shell
   chgrp [-R] 属组名 文件名
   # -R递归更改文件属组，就是在更改某个目录文件的属组时，加上-R参数，那么该目录下的所有文件属组都会更改
   ```

2. `chown`：更改文件属主，也可以同时更改文件属组

   ```shell
   chown [–R] 属主名 文件名
   chown [-R] 属主名：属组名 文件名
   ```

3. `chmod`：更改文件的9个属性

   Linux文件属性有两种设置方法，一种是数字，一种是符号。

   Linux 文件的基本权限就有九个，分别是 **owner/group/others(拥有者/组/其他)** 三种身份各有自己的 **read/write/execute** 权限。文件的权限字符为： **-rwxrwxrwx** ， 这九个权限是三个三个一组的！其中，我们可以使用数字来代表各个权限，各权限的分数对照表如下：

   - r:4
   - w:2
   - x:1

   每种身份(owner/group/others)各自的三个权限(r/w/x)分数是需要累加的，例如当权限为： **-rwxrwx---** 分数则是：

   - owner = rwx = 4+2+1 = 7
   - group = rwx = 4+2+1 = 7
   - others= --- = 0+0+0 = 0

   所以等一下我们设定权限的变更时，该文件的权限数字就是 **770**。变更权限的指令 chmod 的语法是这样的：

   ```shell
    chmod [-R] xyz 文件或目录
   ```

   选项与参数：

   - xyz : 就是刚刚提到的数字类型的权限属性，为 rwx 属性数值的相加。
   - -R : 进行递归(recursive)的持续变更，亦即连同次目录下的所有文件都会变更

   举例来说，如果要将 .bashrc 这个文件所有的权限都设定启用，那么命令如下：

   ```shell
   [root@www ~]# ls -al .bashrc
   -rw-r--r--  1 root root 395 Jul  4 11:45 .bashrc
   [root@www ~]# chmod 777 .bashrc
   [root@www ~]# ls -al .bashrc
   -rwxrwxrwx  1 root root 395 Jul  4 11:45 .bashrc
   ```

那如果要将权限变成 *-rwxr-xr--* 呢？那么权限的分数就成为 [4+2+1] [4+0+1] [4+0+0]=754。

![举例](http://img.codelin.xyz/20200918154259.png)

---

符号类型改变权限

## 文件与目录管理

- **绝对路径：**
  路径的写法，由根目录 **/** 写起，例如： /usr/share/doc 这个目录。
- **相对路径：**
  路径的写法，不是由 **/** 写起，例如由 /usr/share/doc 要到 /usr/share/man 底下时，可以写成： **cd ../man** 这就是相对路径的写法。

### 创建目录

```shell
mkdir test    <==创建一个名为test的新目录
mkdir -p test1/test2/test3   <==创建多级目录
```

### cp (复制文件或目录)

cp 即拷贝文件和目录。

语法:

```shell
[root@www ~]# cp [-adfilprsu] 来源档(source) 目标档(destination)
[root@www ~]# cp [options] source1 source2 source3 .... directory
```

选项与参数：

- **-a：**相当於 -pdr 的意思，至於 pdr 请参考下列说明；(常用)
- **-d：**若来源档为连结档的属性(link file)，则复制连结档属性而非文件本身；
- **-f：**为强制(force)的意思，若目标文件已经存在且无法开启，则移除后再尝试一次；
- **-i：**若目标档(destination)已经存在时，在覆盖时会先询问动作的进行(常用)
- **-l：**进行硬式连结(hard link)的连结档创建，而非复制文件本身；
- **-p：**连同文件的属性一起复制过去，而非使用默认属性(备份常用)；
- **-r：**递归持续复制，用於目录的复制行为；(常用)
- **-s：**复制成为符号连结档 (symbolic link)，亦即『捷径』文件；
- **-u：**若 destination 比 source 旧才升级 destination ！

用 root 身份，将 root 目录下的 .bashrc 复制到 /tmp 下，并命名为 bashrc

```shell
[root@www ~]# cp ~/.bashrc /tmp/bashrc
[root@www ~]# cp -i ~/.bashrc /tmp/bashrc
cp: overwrite `/tmp/bashrc'? n  <==n不覆盖，y为覆盖
```

### mv (移动文件与目录，或修改名称)

语法：

```shell
[root@www ~]# mv [-fiu] source destination
[root@www ~]# mv [options] source1 source2 source3 .... directory
```

选项与参数：

- -f ：force 强制的意思，如果目标文件已经存在，不会询问而直接覆盖；
- -i ：若目标文件 (destination) 已经存在时，就会询问是否覆盖！
- -u ：若目标文件已经存在，且 source 比较新，才会升级 (update)

复制一文件，创建一目录，将文件移动到目录中

```shell
[root@www ~]# cd /tmp
[root@www tmp]# cp ~/.bashrc bashrc
[root@www tmp]# mkdir mvtest
[root@www tmp]# mv bashrc mvtest
```

将某个文件移动到某个目录去，就是这样做！

将刚刚的目录名称更名为 mvtest2

```shell
[root@www tmp]# mv mvtest mvtest2
```

### 文件内容查看

Linux系统中使用以下命令来查看文件的内容：

- cat 由第一行开始显示文件内容

- tac 从最后一行开始显示，可以看出 tac 是 cat 的倒着写

- nl  显示的时候，顺道输出行号！

- more 一页一页的显示文件内容（空格翻页，enter代表向下看一行，:f看到行号）

  ![](http://img.codelin.xyz/20200918155451.png)

- less 与 more 类似，但是比 more 更好的是，他可以往前翻页！（方向键或空格，退出使用q命令，查找字符串用/）

  ![查找字符串](http://img.codelin.xyz/20200918160351.png)

- head 只看头几行（经测试为10行）

  可以通过-n参数选择看几行，tail相同

- tail 只看尾巴几行（经测试为10行）

网络配置目录：`cd /etc/sysconfig/network-scripts`

![](http://img.codelin.xyz/20200918154819.png)

查看网络配置`ifconfig`

### 硬链接和软连接

硬链接：A---B，假设B是A的硬链接，那么他们两个指向了同一个文件，允许一个文件拥有多个路径，用户可以通过这种机制建议硬链接到一些重要文件上，防止误删

软链接：类似Windows下的快捷方式，删除源文件，快捷方式也访问不了

创建链接 `ln` 命令

创建软连接`ln -s`

![](http://img.codelin.xyz/20200918161417.png)

如图，软链接就是个快捷方式

![](http://img.codelin.xyz/20200918161454.png)

### Vim编辑器

**命令模式：**

用户刚刚启动 vi/vim，便进入了命令模式。

此状态下敲击键盘动作会被Vim识别为命令，而非输入字符。比如我们此时按下i，并不会输入一个字符，i被当作了一个命令。

以下是常用的几个命令：

- **i** 切换到输入模式，以输入字符。
- **x** 删除当前光标所在处的字符。
- **:** 切换到底线命令模式，以在最底一行输入命令。

若想要编辑文本：启动Vim，进入了命令模式，按下i，切换到输入模式。

命令模式只有一些最基本的命令，因此仍要依靠底线命令模式输入更多命令。

**输入模式：**

在命令模式下按下i就进入了输入模式。

在输入模式中，可以使用以下按键：

- **字符按键以及Shift组合**，输入字符
- **ENTER**，回车键，换行
- **BACK SPACE**，退格键，删除光标前一个字符
- **DEL**，删除键，删除光标后一个字符
- **方向键**，在文本中移动光标
- **HOME**/**END**，移动光标到行首/行尾
- **Page Up**/**Page Down**，上/下翻页
- **Insert**，切换光标为输入/替换模式，光标将变成竖线/下划线
- **ESC**，退出输入模式，切换到命令模式

**底线命令模式**

在命令模式下按下:（英文冒号）就进入了底线命令模式。

底线命令模式可以输入单个或多个字符的命令，可用的命令非常多。

在底线命令模式中，基本的命令有（已经省略了冒号）：

- q 退出程序
- w 保存文件

按ESC键可随时退出底线命令模式。

简单的说，我们可以将这三个模式想成底下的图标来表示：

![](https://www.runoob.com/wp-content/uploads/2014/07/vim-vi-workmodel.png)

vim命令如果文件不存在的话，就会创建文件，存在的话就会进入存在的文件

`set nu`设置行号

![](http://img.codelin.xyz/20200918165045.png)

### 账号管理

#### 添加用户

`useradd` 命令 添加用户，比如

useradd -选项 用户名

-m：自动创建这个用户的主目录/home/lzy

参数说明：

- 选项:

  - -c comment 指定一段注释性描述。
  - -d 目录 指定用户主目录，如果此目录不存在，则同时使用-m选项，可以创建主目录。
  - -g 用户组 指定用户所属的用户组。
  - **-G 用户组，用户组 指定用户所属的附加组。**
  - -s Shell文件 指定用户的登录Shell。
  - -u 用户号 指定用户的用户号，如果同时有-o选项，则可以重复使用其他用户的标识号。

- 用户名:

  指定新账号的登录名。

实例1

```bash
# useradd -d /home/lzy -m lzy
```

此命令创建了一个用户sam，其中-d和-m选项用来为登录名lzy产生一个主目录 /home/lzy（/home为默认的用户主目录所在的父目录）。

实例2

```bash
# useradd -s /bin/sh -g group –G adm,root gem
```

此命令新建了一个用户gem，该用户的登录Shell是 `/bin/sh`，它属于group用户组，同时又属于adm和root用户组，其中group用户组是其主组。

这里可能新建组：`#groupadd group及groupadd adm`

增加用户账号就是在/etc/passwd文件中为新用户增加一条记录，同时更新其他系统文件如/etc/shadow, /etc/group等。

Linux提供了集成的系统管理工具userconf，它可以用来对用户账号进行统一管理。

> 添加一个用户就是往文件中写入了一个用户信息

#### 删除修改切换用户

删除用户 userdel

`userdel -r lzy` 删除用户的时候将他的目录一并删除

修改用户 usermod 选项 用户名

切换用户

root用户

1. 切换用户的命令为：su username

2. 从普通用户切换到root用户，可以使用命令sudo su

3. 在终端键入exit或者logout或使用快捷方式ctrl+d，可以退回到原来用户

4. 在切换用户时，如果想在切换用户之后使用新用户的工作环境，可以在su和username之间加-，例如【su-root】

   $表示普通用户

   #表示root用户

#### 用户的密码问题

用户的密码设置问题

我们一般通过root创建用户的时候配置密码

`passwd username`

#### 锁定账户

`passwd -l username`  该用户被锁定，就不能登陆了

`passwd -d username`  该用户没有密码，也不能登录

### 用户组管理

1. 创建一个用户组 groupadd name

   创建完用户组后可以得到一个组的id，这个id是可以指定的

   `group -g 520 codelin`，如果不指定就是自增1

2. 删除用户组 groupdel name

3. 修改用户组的权限信息和名字 groupmod -g -n （分别为切换id和名字）

4. 用户如果要切换用户组（登陆当前用户）

   `newgrp root`

5. 文件的查看

   /etc/passwd
   
   登录口令：把真正的加密后的用户口令存放到/etc/shadow文件中

### 磁盘管理


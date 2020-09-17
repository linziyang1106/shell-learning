## Linux文件基本属性

修改文件或目录的所属用户与权限

- chown (change ownerp) ： 修改所属用户与组。
- chmod (change mode) ： 修改用户的权限。

使用`ll`命令可以显示文件的属性及其文件所属的用户和组

![ll查看文件](http://img.codelin.xyz/20200917195140.png)

![](https://www.runoob.com/wp-content/uploads/2014/06/363003_1227493859FdXT.png)

`d`代表目录，`-`代表文件，权限的顺序都一致且都存在，无则用`-`表示

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
从零开始开发一个操作系统

###  序言

在2019年的最后一天终于完成了整个系统的开发，并给它起名曰——**Inios** 。就如同文章名字一样，完全是从内核编写，非二次开发，从最初的“hello os”到初次有了系统的样子。主要用C语言编写，部分汇编语言。。整个操作系统完成后的大小为`39.6 KB`之所以这么小其实主要是语言的原因，另一个重要原因是在开发中对部分系统代码和字体库以及媒体的压缩。中间进行多次迭代，最终完成整个操作系统的开发[Inios](https://github.com/YJLAugus/Inios)。

### 系统预览

![](https://images.cnblogs.com/cnblogs_com/yjlaugus/1110802/o_suc.png)

### 开发环境及主要工具

* win 8.1 x64 :用来开发Inios的“载体”
* qemu 虚拟机：测试Inios
* wxmedit:16进制编辑器
* nsak:汇编器
* Notepad++：代码编辑器
* Git：除了提交代码外，还用来生成特殊文件

### 系统功能

#### 命令行终端

* `mem`: 显示内存的使用情况
* `cls`: 清空控制台内容
* `dir`: 列出目录
* `type`:查看文件内容
* `hlt`:运行.hrb可执行程序
* `shift+F1`:强制关闭程序
* `enter`:关闭当前应用程序窗口
* `F11`:将最下面的窗口置顶
* `Tab`:切换窗口
* `鼠标点击`：切换窗口/移动窗口
* `shift+F2`:打开终端/打开另一个终端窗口（支持多个） 
* `exit`:关闭当前终端窗口
* `ncst xx`：一个终端可以运行多个程序

#### 保护系统

主要做了“内存访问权限 ”、“异常”和“应用程序存入DS操作系统用的段地址”。

#### 多任务

常用的多任务，如果一个系统只能运行一个程序的话，其实是缺少灵魂的。

![](https://images.cnblogs.com/cnblogs_com/yjlaugus/1110802/o_taskmen.png)

#### 文字显示

在原来的基础上，实现了中文显示，用到HZK16.fnt编码库。虽然字体库较大，但是经过压缩后，还是小了一半。

![](https://images.cnblogs.com/cnblogs_com/yjlaugus/1110802/o_Chinese.png)

#### 鼠标、键盘控制

一个操作系统常用的功能，需要说明的一点的是，在进行鼠标控制时，用现在的鼠标控制并不好用，可能是更改了协议，不过值得庆幸的是，用笔记本的触摸板进行测试，效果还是不错的。

#### 窗口应用程序

可视化窗口程序支持。

#### 媒体播放

这里的媒体主要是指“音频”，说是音频，其实不如说“蜂鸣器”演奏的好，因为我们的音乐都是用“蜂鸣器”来发声的。

![](https://images.cnblogs.com/cnblogs_com/yjlaugus/1110802/o_nusic.png)

#### 压缩

采用的是作者自己做的压缩工具，前后权衡，既可以保证压缩率，也可保证解压速度——`tek`压缩。

![](https://images.cnblogs.com/cnblogs_com/yjlaugus/1110802/o_tek.png)

#### 图片预览

支持`jpg`和`bmp`格式图片预览。

![](https://images.cnblogs.com/cnblogs_com/yjlaugus/1110802/o_picphone.png)

### 初始开发文档

起初是想这每天都会记录，记录包括但不限于开发中的bug及容易忽略的问题和技巧。但是由于时间原因只是写了5天的文档，后面的会后续补充。仔细想想这5天其实也足够了，其中包括开发中所需要的初始流程及工具的介绍和使用。如果您也想试着开发玩玩，不妨看下这个简单的文档。文档链接：[说明文档.pdf](https://files.cnblogs.com/files/yjlaugus/%E8%AF%B4%E6%98%8E%E6%96%87%E6%A1%A3.zip)

### 写在最后

至此文章写完，虽然每次都进行测试。但难免有所疏漏，如有有问题，欢迎指正，我将不胜感激。项目开源，如果您对此有着兴趣欢迎继续开发。如果可以的话，可以点一个一个`star`支持。这将是对我最大的鼓励，拳拳谢意，无以言表。

###  参考文献

* 《汇编语言（第三版）王爽著》
* 《操作系统设计与实现 上册 Andrew S.Tanenbaum 著》
* 《30天自制操作系统 川合秀实 著》






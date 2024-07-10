**Linux系统跨架构运行RenPy游戏**

一般来说，Linux运行RenPy游戏，只需执行shell脚本即可。但，RenPy游戏**仅提供对amd64架构的直接支持**，假设你手上有台非amd64架构的Linux电脑，怎么办？凉拌炒鸡蛋吗？

不可能！

恰巧，我有个新奇的想法：**运行py脚本，让RenPy游戏在这些架构上原生运行。**

这个想法能实现吗？理论存在，实践开始！

**注：·想要验证此想法的，请在虚拟机环境下验证！还不放心的，请创建快照！**

**&emsp;&emsp;·RenPy版本得8.2.x，低于此版本的不好说。**

一、开始实践

>1、一般情况（_如debian sid_）：

&emsp;1）安装pip和curl
```
    sudo apt install python3-pip curl
```
&emsp;2）安装future、ecdsa、pefile、requests四个模块
```
    pip3 install future ecdsa pefile requests --break-system-packages
```
&emsp;&emsp;_注：要是觉得pip下载速度慢，可以使用镜像源加速下载_

&emsp;3）安装python3-pygame-sdl2和python3-renpy
```
    sudo apt install python3-pygame-sdl2 python3-renpy
```
&emsp;&emsp;_注：安装这两个包，apt会自动处理libjpeg62-turbo、libpng16-16t64、libsdl2-image-2.0-0、libsdl2-mixer-2.0-0、libsdl2-ttf-2.0-0这五个依赖_

&emsp;4）运行py脚本
&emsp;在游戏根目录打开终端，输入
  ```
    python3 xxx.py
  ```
&emsp;&emsp;_注：xxx替换成游戏名_

>2、源里无python3-renpy、python3-pygame-sdl2的（_如deepin23rc2_）:

&emsp;1）执行1、中的第1）、第2）步

&emsp;2）去[这里](https://www.debian.org/distrib/packages)搜**libjpeg62-turbo、libpng16-16t64、libsdl2-image-2.0-0、python3-renpy、python3-pygame-sdl2**五个软件包

&emsp;3）进入下载目录，打开终端，apt安装**2）中下载的软件包**

&emsp;&emsp;_注：libpng16-16t64会替代libpng-16，这是正常现象_

&emsp;4）执行1、中的第4）步

二、问题解答

&emsp;1）pip下载模块的速度好慢

&emsp;答：在后面添加镜像源网址。如：_pip3 install 模块 --break-system-packages -i **镜像源网址**_

&emsp;2）apt提示缺少依赖

&emsp;答：缺哪个依赖包，去[这里](https://www.debian.org/distrib/packages)搜缺失的依赖包并安装

&emsp;3）有版本限制吗？

&emsp;答：这个还真有，主要看python3-renpy的版本。_**若版本为8.2.2，只能兼容8.2.X。若版本为8.1.3，只能兼容8.1.X。若版本为8.0.3，只能兼容8.0.X。。。**_

&emsp;4）如何对RenPy游戏进行升级？

&emsp;答：进行拆包、反编译脚本，再用8.2.2版本的sdk重新编译，部分游戏还需修改代码才能正常编译。_至于怎么操作，请自行搜索。_

&emsp;5）所有架构都适用吗？

&emsp;答：不能说所有，只能说很多。amd64可以，arm64也可以，loongarch64（新世界）理论上也行，riscv64好像也可以。。。

&emsp;6）哦，对了，可以通过添加lib库的方式支持Linux吗？

&emsp;答：诶，你这个提问好像可以哦。把renpy-8.X.X-sdk\lib里的py3-linux-aarch64、py3-linux-x86_64都复制到游戏里的lib文件夹里，sdk根目录下的renpy.sh复制到游戏根目录。再把renpy改为 游戏名 就行。

&emsp;_**注：版本要对应，不要随便复制粘贴！**_

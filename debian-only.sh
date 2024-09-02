read -p "请输入cpu架构：" arch
echo -e "\033[36m开始安装pip3和curl......\033[0m"
sleep 0.2
sudo apt install -y python3-pip curl
echo -e "\033[36m开始安装future、ecdsa、pefile、requests四个模块......\033[0m"
sleep 0.2
pip3 install future ecdsa pefile requests --break-system-packages -i https://pypi.tuna.tsinghua.edu.cn/simple/
mkdir /home/renpy-depend/
echo -e "\033[36m从镜像站下载相关软件包及其依赖......\033[0m"
sleep 0.2
curl -o /home/renpy-depend/python3-renpy_8.2.2+dfsg-1+b1_$arch.deb -# https://mirrors.ustc.edu.cn/debian/pool/main/r/renpy/python3-renpy_8.2.3+dfsg-1_$arch.deb
curl -o /home/renpy-depend/python3-pygame-sdl2_8.2.2-1_$arch.deb -# https://mirrors.ustc.edu.cn/debian/pool/main/p/pygame-sdl2/python3-pygame-sdl2_8.2.2-1+b1_$arch.deb
curl -o /home/renpy-depend/libjpeg62-turbo_2.1.5-3_$arch.deb -# http://mirrors.ustc.edu.cn/debian/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.1.5-3_$arch.deb
curl -o /home/renpy-depend/libpng16-16t64_1.6.43-5_$arch.deb -# http://mirrors.ustc.edu.cn/debian/pool/main/libp/libpng1.6/libpng16-16t64_1.6.43-5_$arch.deb
curl -o /home/renpy-depend/libsdl2-image-2.0-0_2.8.2+dfsg-1+b1_$arch.deb -# http://mirrors.ustc.edu.cn/debian/pool/main/libs/libsdl2-image/libsdl2-image-2.0-0_2.8.2+dfsg-1+b1_$arch.deb
sudo chmod 777 /home/renpy-depend/*.deb
echo -e "\033[36m开始安装相关软件包及其依赖......\033[0m"
sleep 0.2
sudo apt install -y /home/renpy-depend/*.deb
echo -e "\033[36m清理缓存......\033[0m"
sleep 0.2
sudo rm -rf /home/renpy-depend/
echo -e "\033[36m搞定！\033[0m"



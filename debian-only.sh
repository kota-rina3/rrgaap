echo -e "\033[36m开始安装pip3和curl......\033[0m"
sleep 0.5
sudo apt install -y python3-pip curl
echo -e "\033[36m开始安装future、ecdsa、pefile、requests四个模块......\033[0m"
sleep 0.5
pip3 install future ecdsa pefile requests --break-system-packages -i https://pypi.tuna.tsinghua.edu.cn/simple
echo -e "\033[36m从镜像站下载相关软件包及其依赖......\033[0m"
sleep 0.5
curl -o /home/${USER}/Desktop/python3-renpy_8.2.2+dfsg-1+b1_amd64.deb -# http://mirrors.ustc.edu.cn/debian/pool/main/r/renpy/python3-renpy_8.2.2+dfsg-1+b1_amd64.deb
curl -o /home/${USER}/Desktop/python3-pygame-sdl2_8.2.2-1_amd64.deb -# http://mirrors.ustc.edu.cn/debian/pool/main/p/pygame-sdl2/python3-pygame-sdl2_8.2.2-1_amd64.deb
curl -o /home/${USER}/Desktop/libjpeg62-turbo_2.1.5-3_amd64.deb -# http://mirrors.ustc.edu.cn/debian/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.1.5-3_amd64.deb
curl -o /home/${USER}/Desktop/libpng16-16t64_1.6.43-5_amd64.deb -# http://mirrors.ustc.edu.cn/debian/pool/main/libp/libpng1.6/libpng16-16t64_1.6.43-5_amd64.deb
curl -o /home/${USER}/Desktop/libsdl2-image-2.0-0_2.8.2+dfsg-1+b1_amd64.deb -# http://mirrors.ustc.edu.cn/debian/pool/main/libs/libsdl2-image/libsdl2-image-2.0-0_2.8.2+dfsg-1+b1_amd64.deb
sudo chmod 777 *.deb
echo -e "\033[36m开始安装相关软件包及其依赖......\033[0m"
sleep 0.5
sudo apt install -y /home/${USER}/Desktop/lib*.deb
sudo apt install -y /home/${USER}/Desktop/python3-*.deb
echo -e "\033[36m清理缓存......\033[0m"
sleep 0.5
sudo rm -rf /home/${USER}/Desktop/*.deb
echo -e "\033[36m搞定！\033[0m"



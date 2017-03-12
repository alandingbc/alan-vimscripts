# alan-vimscripts
alan's own vimscripts configuration.
（备注：这是我个人的终端Vim配置，部分GUI环境下如gvim并为测试）

## 1.准备
### 1.1 更新Vim 8.0
部分功能实现只有Vim version 8.0支持，目前Ubuntu环境下利用apt-get install vim均为7.4版本，请利用`vim --version`查看当前Vim版本。如果已经安装Vim且非8.0以上版本，利用`apt-get remove vim`删除原版，并于[此处下载最新Vim 8.0版本](https://github.com/vim/vim.git)。具体安装流程请参考其文档说明。
补充：安装Vim 8.0
```
cd vim80/ 
#注意一定要使能python不然会提示上面贴出来的错误
./configure --enable-multibyte --enable-pythoninterp=yes --enable-python3interp=yes
make
make install
vim -version
```
如果提示无法找到vim，请执行如下操作
```
sudo ln -s  /usr/local/bin/vim  /usr/bin/vim
```

## 2.安装
### 2.1 安装VimScripts配置
```
git clone https://github.com/alanlilyan/alan-vimscripts.git
cd path/to/alan-vimscripts
make install

```
如有问题，请检查`install.sh`脚本权限，可以手动修改权限
```
sudo chmod 0777 install.sh
```
等待脚本执行，执行完毕。其中YouCompleteMe插件可能耗时较久，所以使用单独的`git clone`命令，请耐心等待并注意检查是否正确下载。也可以直接
```
cd ~/.vim/bundle/
git clone https://github.com/Valloric/YouCompleteMe.git
```
建议无论是利用脚本或是手动下载，请确认该插件完整下载。
脚本执行完毕，会打开一个Vim窗口，直接退出即可。

### 2.2 卸载VimScripts配置
进入下载目录`path/to/alan-vimscripts`，执行`make clean`。或者手动删除添加的目录内容，请查看`install.sh`内容，很简单。

### 2.3 配置YouCompleteMe插件
该插件为Google C++工程师编写，用于智能补全，语义语法检测报错，可以很好支持C语言系列，也支持Java、C#、Python等。配置较为麻烦，网络上有各种说法，核心是利用Clang和Cmake工具生成ycm_core。
首先是下载更新Clang和Cmake：
```
sudo apt-get install clang cmake
```
也可以通过官方站点下载编译好的二进制程序，[LLVM Download Page](http://releases.llvm.org/download.html)。请仔细参考[YCM说明文档](https://github.com/Valloric/YouCompleteMe/blob/master/README.md)。
安装完毕后,执行如下操作：
(注意:下面的操作依赖Clang和Cmake。`install.py`脚本参数可以选择，`--all`是选择安装支持所有语言类型）
```
cd ~/.vim/bundle/YouCompleteMe
./install.py --all
```
上述脚本执行可能会弹出提示需要下载其他模块，请根据提示执行即可。安装完成后：
```
cp .vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py ~/
```

### 2.4 Powerline Fonts补丁
[Powerline 补丁地址](https://powerline.readthedocs.io/en/latest/installation/linux.html#font-installation)
按照上述地址内容操作，即可完Powerline字体补丁。完成后重启即可改变Vim状态栏显示内容。

至此安装完毕。其余插件功能均在VimScripts中配置。

## 3.沟通交流
对于本人的配置，如有意见和建议，欢迎提问和交流。
* E-mail: 1439674920@qq.com or alan.lilyan@gmail.com

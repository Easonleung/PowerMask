# PowerMask
Auto Initial Debian Development Environment

> 本脚本适用于 Debian9.x，经过一百二十八道工序严格测试，可以完美无伤安装 Adapt_framework 以及 Adapt_Authoring 运行以及开发环境。特别适用于在 WINDOWS 环境下，通过虚拟机安装 Debian9x 系统并运行部署。

# 1. 脚本说明

脚本名称：AdaptEnvironmentInit.sh

PowerMask 经过 Debian9.x 统测试，可完美运行。关于衍生系统 UBUNTU 能否正常运行，尚未证实。如想在 CentOS / SUSE / REDHET 系统下运行，请自觉滚开。

PowerMask 默认安装以下软件，以及软件运行所需运行库和相关程序或代码：

- sudo 
- net-tools
- tree
- git
- vim
- curl
- nvm

PowerMask 默认安装 Node 最新的 12.x 以及 8.x 两个版本

PowerMask 默认安装 PHP 7.3 以及 MongoDB 4.3.4 开发版

PowerMask 默认安装 MariaDB

PowerMask 默认安装 NGINX 高性能 WEB 服务器

PowerMask 默认安装 Moodle 

PowerMask 默认安装 Adapt_Framework v5.1.0 以及 Adapt_Authoring

nvm install --lts       # Too Slow

nvm install 8.16.0      # Too Slow

# 2. 准备工作

- 安装 Debian 9.x 版本操作系统，建议 WINDOWS 用户使用虚拟机安装，WINDOWS10-1909 用户，请使用 Hyper-V 或者 VMWare 15.5 虚拟机平台创建 Debian9.x 虚拟机，虚拟磁碟大小建议采用 20GB 或以上。
- 系统安装完成后，编辑 /etc/apt/sources.list 文档，添加 aliyun 的软件源，别问为什么，因为快。

su

vi /etc/apt/sources.list

将下面这堆编辑到 sources.list 里面去

deb http://mirrors.163.com/debian/ stretch main non-free contrib

deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib

deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib

deb-src http://mirrors.163.com/debian/ stretch main non-free contrib

deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib

deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib

deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib

deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib

- 默认安装完成 Debian9.x 系统以后，无需进行任何其他更新或者系统升级操作，即可运行 PowerMask 脚本。
>注意：Debian9.x 系统安装完成后，请勿使用 ROOT 账户登录

# 2. 运行脚本

- 使用你的个人用户，例如 yourname 登录系统后，在母机使用 scp 指令，上载脚本到 /home/yourname 目录下，执行 bash PowerMask.sh 运行脚本

bash PowerMash.sh

> 注意，不要使用 sh 指令运行脚本

由于 Debian9.x 默认没有安装 sudo 指令，因此脚本在执行之初，会进行系统初始化动作，自动更新系统以及安装 sudo 指令，在次期间，脚本需要启动 ROOT 权限，因此可能会要求输入 5-6 次 ROOT 密码，请不厌其烦地按照脚本要求，输入 ROOT 密码以配合系统初始化，系统完成初始化后，将不再需要输入密码。

# 3. 默认配置

> 由于系统配置各有所好，因此暂时不提供默认配置脚本

# 4. 其他说明

## 关于 NODEJS

原计划是使用 nvm 安装 Nodejs 最新的 LTS 开发版，但 nvm 自带的源实在慢得天荒地老，所以最终还是选择了 Debian 标准库里的 Nodejs 版本。如果网络环境较好的童鞋，可以修改 PowerMask.sh 中第207行，第208行脚本注释取消，并将 212 - 216 注释删掉进行 nvm 源安装。

scp PowerMask.sh yourname@yourvm:/home/yourname/.

ssh yourname@yourvm

bash PowerMask.sh

当脚本安装 NODEJS 的时候，您可以去洗个澡或者煮个泡面，因为各种源的速度都不快……

## 关于 MariaDB

由于 MYSQL 被收购以后，越来越惹人讨厌了。MariaDB 属于 MYSQL 的 FORK，性能也不俗于 MYSQL，所以。。。这个选择纯粹个人爱好，喜欢 MYSQL 的请自行安装，多谢。

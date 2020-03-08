#!/bin/bash

echo ""
echo ""
echo "PowerMask System Initialization"
echo "=========================================="
echo "WARNING:"
echo "This Machine is Huge Psyho System. It base"
echo "on Debian9.x. If you want to install it at"
echo "Different System. Please Fuck Off!!!"
echo ""


read -p "ROOT PASSWORD FOR GLOBAL:" -s rootpassword

echo""

# ==== UPGRADE DEBIAN 9x ====================== "
echo ""
echo "UPGRADE SYSTEM"
echo "=========================================="
echo ""
echo "ROOT PASSWORD FOR UPDATE SYSTEM"
su root -c "apt-get update"
echo ""
echo "ROOT PASSWORD FOR UPGRADE"
su root -c "apt-get upgrade -y"


# ==== INSTALL SUDO ======================== #
echo ""
echo "SYSTEM INITIALATION"
echo "=========================================="
echo ""
echo "#===> Install sudo ..."
echo ""
echo "ROOT PASSWORD FOR INSTALL SUDO"
su root -c "apt-get install sudo -y" 

dir="/etc/sudoers.d/"
filename=${USER}
content="\"$filename\" ALL=(ALL) ALL"

if [ ! -d "$dir" ]; then
    
    echo ""
    echo "ROOT PASSWORD FOR MKDIR SUDOERS.D"
    su root -c "mkdir $dir"
    
    echo ""
    echo "ROOT PASSWORD FOR MKFILE YOURNAME"
    su root -c "touch \"$dir$filename\""    
    
    echo ""
    echo "AGAIN..."
    su root -c "echo \"$content\" > \"$dir$filename\""
else
    
    echo ""
    echo "AGAIN"
    su root -c "touch \"$dir$filename\""
    
    echo ""
    echo "AND AGAIN..."
    su root -c "echo \"$content\" > \"$dir$filename\""
fi



################################################
echo ""
echo ""
echo "INSTALL BASE TOOLS"
echo "========================================="
echo ""
################################################



# ==== INSTALL IFCONFIG ===================== #
echo ""
echo "===> Install net-tools ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install net-tools  


# ==== INSTALL TREE ======================== #
echo ""
echo "===> Install tree ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install tree


# ==== INSTALL GIT ======================== #
echo ""
echo "===> Install git ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install git -y


# ==== INSTALL VIM ======================== #
echo ""
echo "===> Install vim ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install vim -y

# ==== INSTALL CURL ======================== #
echo ""
echo "===> Install curl ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install curl -y


################################################
echo ""
echo ""
echo "INSTALL DEVELOPMENT SOFTWARE"
echo "========================================="
echo ""
################################################

# ==== INSTALL PHP7.3 ======================== #
echo ""
echo "===> Install PHP7.3 ..."
echo ""
echo ""
echo "... install base tools ..."
echo ""
echo "$rootpassword" | sudo -S apt-get -y install apt-transport-https ca-certificates

echo ""
echo "... add sury source ..."
echo ""
echo "$rootpassword" | sudo -S wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

echo ""
echo "... update source ..."
echo ""
echo "$rootpassword" | sudo -S sh -c 'echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list'
echo "$rootpassword" | sudo -S apt-get update

echo ""
echo "... Install PHP7.3 ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install php7.3 -y

# ==== INSTALL MARIADB ======================== #
echo ""
echo "===> Install MariaDB ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install -y mysql-server mysql-client


# ==== INSTALL MongoDB ======================== #
echo ""
echo "===> Install MongoDB ..."
echo ""
echo "... get apt-key from www.mongodb.org ..."
echo ""
curl https://www.mongodb.org/static/pgp/server-4.0.asc | sudo apt-key add -

echo ""
echo "... add source ..."
echo ""
echo "$rootpassword" | sudo -S sh -c 'echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" > /etc/apt/sources.list.d/php.list'

echo ""
echo "... update source ..."
echo ""
echo "$rootpassword" | sudo -S apt-get update

echo ""
echo "... install mongodb ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install mongodb-org -y

echo ""
echo "... start mongodb service ..."
echo ""
echo "$rootpassword" | sudo -S systemctl enable mongod
echo "$rootpassword" | sudo -S systemctl start mongod


# ==== INSTALL NGINX ======================== #
echo ""
echo "===> Install Nginx ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install nginx -y




# ==== INSTALL NVM ======================== #
echo ""
echo "===> Install nvm ..."
echo ""

# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"					 # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"	 # This loads nvm bash_completion

echo ""
echo "===> Install node.js 12.x ..."
echo ""
## nvm install --lts		# Too Slow
## nvm install 8.16.0		# Too Slow
curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
echo "$rootpassword" | sudo -S apt-get install nodejs 

##echo ""
##echo "===> Install node.js 8.x ..."
##echo ""
##curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
##echo "$rootpassword" | sudo -S apt-get install nodejs


################################################
echo ""
echo ""
echo "INSTALL ADAPT PLATFORM"
echo "========================================="
echo ""
################################################


# ==== INSTALL ADAPT AUTHORING ======================== #
echo ""
echo "===> Install Adapt_authoring ..."
echo ""
echo "... clone Adapt_authoring ..."
echo ""
git clone https://github.com/adaptlearning/adapt_authoring.git
cd adapt_authoring
npm install --production && node install



# ==== INSTALL ADAPT FRAMEWORK ======================== #
echo ""
echo "===> Install Adapt_framework ..."
echo ""
echo ""
echo "... clone Adapt_authoring ..."
echo ""
git clone https://github.com/adaptlearning/adapt_framework.git

echo "... install grunt ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install grunt 

echo ""
echo "... install cnpm ..."
echo ""
echo "$rootpassword" | sudo -S npm install -g cnpm --registry=https://registry.npm.taobao.org 

echo ""
echo "... install adapt_framework ..."
echo ""
cd adapt_framework-master
cnpm install
adapt install

echo ""
echo "... install rub ..."
echo ""
echo "$rootpassword" | sudo -S chown -R $USER /usr/lib
echo "$rootpassword" | sudo -S npm install -g grunt-cli
echo "$rootpassword" | sudo -S npm install -g rub-cli
pkexec chown root /usr/lib/sudo/sudoers.so

echo ""
echo ""
echo "Enjoy Ur Platform."
echo ""
echo "THE END."

#!/bin/bash

echo ""
echo ""
echo "PowerMask-Totara System Initialization"
echo "=========================================="
echo "WARNING:"
echo "This Machine is Huge Psyho System. It base"
echo "on Debian11.x. If you want to install it at"
echo "Different System. Please Fuck Off!!!"
echo ""
echo "+------------------------------------+"
echo "| AUTHOR:    Eason.L                 |"
echo "| DATETIME:  2022.03.12              |"
echo "| SYSTEM:    Debian11.x              |"
echo "| TOKEN:     NONE                    |"
echo "+------------------------------------+"
echo ""
echo ""
read -p "ROOT PASSWORD FOR GLOBAL:" -s rootpassword

echo""

# ==== INSTALL SUDO ======================== #
echo ""
echo "SYSTEM INITIALATION"
echo "=========================================="
echo ""
echo "#===> Install sudo ..."
echo ""
echo "ROOT PASSWORD FOR INSTALL SUDO"
echo "$rootpassword" | su root -c "apt-get install sudo -y" 

dir="/etc/sudoers.d/"
filename=${USER}
content="\"$filename\" ALL=(ALL) ALL"

if [ ! -d "$dir" ]; then
    
    echo ""
    echo "ROOT PASSWORD FOR MKDIR SUDOERS.D"
    echo "$rootpassword" | su root -c "mkdir $dir"
    
    echo ""
    echo "ROOT PASSWORD FOR MKFILE YOURNAME"
    echo "$rootpassword" | su root -c "touch \"$dir$filename\""    
    
    echo ""
    echo "AGAIN..."
    echo "$rootpassword" | su root -c "echo \"$content\" > \"$dir$filename\""
else
    
    echo ""
    echo "AGAIN"
    echo "$rootpassword" | su root -c "touch \"$dir$filename\""
    
    echo ""
    echo "AND AGAIN..."
    echo "$rootpassword" | su root -c "echo \"$content\" > \"$dir$filename\""
fi


# ==== INSTALL GIT ======================== #
echo ""
echo "===> Install git ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install git -y


# ==== Get Init Files ======================== #
echo ""
echo "===> Get Init Files ..."
echo ""
git config --global http.sslVerify false
git clone https://github.com/Easonleung/PowerMask.git
echo ""
echo "... Change Source to 163.com Mirror ..."
echo "$rootpassword" | sudo -S cp PowerMask/sources.list.bullseye /etc/apt/sources.list


# ==== UPGRADE DEBIAN 11.x ====================== "
echo ""
echo "UPGRADE SYSTEM"
echo "=========================================="
echo ""
echo "ROOT PASSWORD FOR UPDATE SYSTEM"
echo "$rootpassword" | sudo apt-get update
echo ""
echo "ROOT PASSWORD FOR UPGRADE"
echo "$rootpassword" | sudo apt-get upgrade -y



################################################
echo ""
echo ""
echo "INSTALL BASE TOOLS"
echo "========================================="
echo ""
################################################

# ==== INSTALL UFW ===================== #
echo ""
echo "===> Install UFW ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install ufw -y  
echo "$rootpassword" | sudo ufw allow ssh
echo "$rootpassword" | sudo ufw allow http
echo "$rootpassword" | sudo ufw allow https
echo "$rootpassword" | sudo ufw enable


# ==== INSTALL IFCONFIG ===================== #
echo ""
echo "===> Install net-tools ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install net-tools -y


# ==== INSTALL TREE ======================== #
echo ""
echo "===> Install tree ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install tree

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

# ==== INSTALL PHP7.4 ======================== #
echo ""
echo "===> Install PHP7.4 ..."
echo ""
echo ""
echo "... Get ca-certificates ..."
echo ""
echo "$rootpassword" | sudo -S apt-get -y install apt-transport-https ca-certificates

echo ""
echo "... Get PHP.GPG ..."
echo ""
echo "$rootpassword" | sudo -S wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

echo ""
echo "... Update Source ..."
echo ""
echo "$rootpassword" | sudo -S sh -c 'echo "deb https://packages.sury.org/php/ bullseye main" > /etc/apt/sources.list.d/php.list'
echo "$rootpassword" | sudo -S apt-get update

echo ""
echo "... Install PHP7.4 ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install php7.4 
echo "$rootpassword" | sudo apt-get install php7.4-{bcmath,bz2,intl,gd,mbstring,mysql,zip,fpm} -y
echo "$rootpassword" | sudo systemctl start php7.4-fpm

# ==== INSTALL MARIADB ======================== #
echo ""
echo "===> Install MariaDB Server..."
echo ""
echo "$rootpassword" | sudo -S apt-get install -y mariadb-server
echo ""
echo "... Start&Set MariaDB Server Startup ..."
echo ""
echo "$rootpassword" | sudo systemctl start mariadb
echo "$rootpassword" | sudo systemctl enable mariadb
# echo "$rootpassword" | sudo mysql_secure_installation


# ==== INSTALL NGINX ======================== #
echo ""
echo "===> Install Nginx ..."
echo ""
echo "$rootpassword" | sudo systemctl disable --now apache2 -y
echo "$rootpassword" | sudo -S /etc/init.d/apache2 stop

echo "$rootpassword" | sudo -S apt-get install nginx -y
echo "$rootpassword" | sudo -S cp PowerMask/*.conf /etc/nginx/conf.d/.
echo "$rootpassword" | sudo -S /etc/init.d/nginx start
echo "$rootpassword" | sudo systemctl start nginx


################################################
echo ""
echo ""
echo "INSTALL TOTARA PLATFORM"
echo "========================================="
echo ""
################################################


# ==== INSTALL TOTARA ======================== #
echo ""
echo "===> Setting Totara Location ..."
echo ""
echo "$rootpassword" | sudo mkdir /var/www/html/totara15
echo "$rootpassword" | sudo mkdir /var/www/html/totara13
echo "$rootpassword" | sudo -S cp PowerMask/phpinfo.php /var/www/html/totara15/phpinfo.php
echo "$rootpassword" | sudo -S cp PowerMask/phpinfo.php /var/www/html/totara13/phpinfo.php
echo ""





echo ""
echo ""
echo "Enjoy Ur Platform."
echo ""
echo "THE END."


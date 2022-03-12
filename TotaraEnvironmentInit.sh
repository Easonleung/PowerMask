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
echo "| SYSTEM:    Debian11.x               |"
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
git clone https://github.com/Easonleung/PowerMask.git
echo ""
echo "... Change Source to 163.com Mirror ..."
echo "$rootpassword" | sudo -S cp PowerMask/sources.list.bullseye /etc/apt/sources.list -y


# ==== UPGRADE DEBIAN 11.x ====================== "
echo ""
echo "UPGRADE SYSTEM"
echo "=========================================="
echo ""
echo "ROOT PASSWORD FOR UPDATE SYSTEM"
echo "$rootpassword" | apt-get update
echo ""
echo "ROOT PASSWORD FOR UPGRADE"
echo "$rootpassword" | apt-get upgrade -y



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
echo "... install base tools ..."
echo ""
echo "$rootpassword" | sudo -S apt-get -y install apt-transport-https ca-certificates

#echo ""
#echo "... add sury source ..."
#echo ""
#echo "$rootpassword" | sudo -S wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

echo ""
echo "... update source ..."
echo ""
echo "$rootpassword" | sudo -S sh -c 'echo "deb https://packages.sury.org/php/ bullseye main" > /etc/apt/sources.list.d/php.list'
echo "$rootpassword" | sudo -S apt-get update

echo ""
echo "... Install PHP7.4 ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install php7.4 -y

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


# ==== INSTALL NGINX ======================== #
echo ""
echo "===> Install Nginx ..."
echo ""
echo "$rootpassword" | sudo -S apt-get install nginx -y


################################################
echo ""
echo ""
echo "INSTALL TOTARA PLATFORM"
echo "========================================="
echo ""
################################################


# ==== INSTALL TOTARA ======================== #
echo ""
echo "===> Install Adapt_authoring ..."
echo ""
echo "... clone Adapt_authoring ..."
echo ""





echo ""
echo ""
echo "Enjoy Ur Platform."
echo ""
echo "THE END."


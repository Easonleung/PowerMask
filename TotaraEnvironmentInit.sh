Skip to content
Search or jump to…
Pull requests
Issues
Marketplace
Explore
 
@Easonleung 
Easonleung
/
PowerMask
Public
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
Settings
PowerMask/AdaptEnvironmentInit.sh
@Easonleung
Easonleung Update Description
Latest commit 6765407 on Mar 9, 2020
 History
 1 contributor
283 lines (223 sloc)  6.74 KB
   
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
© 2022 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
Loading complete

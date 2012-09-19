#!/bin/bash

UserInputInstall()
{
	apt-get -y -d install $1
	echo -e "\a";sleep 0.3;echo -e "\a";sleep 0.3;echo -e "\a"
	apt-get -y install $1
}

echo -e "Entrez le mot de passe du serveur MySQL : "
#MYSQLPASSWORD="123";
read MYSQLPASSWORD

clear
echo "=========> ADDING PPA REPOSITORIES"
add-apt-repository -y ppa:gnome3-team/gnome3 #gnome shell
add-apt-repository -y ppa:ricotz/testing #Gnome extensions
add-apt-repository -y ppa:upubuntu-com/chat #Skype
add-apt-repository -y ppa:danielrichter2007/grub-customizer #grub cust
add-apt-repository -y ppa:otto-kesselgulasch/gimp #gimp

clear
echo "=========> UPDATING PACKAGE LIST"
apt-get update

clear
echo "=========> UTILITIES"
apt-get -y install zsh
	chsh -s /bin/zsh
apt-get -y install synaptic
apt-get -y install ubuntu-restricted-extras
apt-get -y install vim
apt-get -y install grub-customizer
apt-get -y install gparted
apt-get -y install p7zip-full
apt-get -y install pdfmod
apt-get -y install virtualbox-ose
apt-get -y install virtualbox-fuse
#UserInputInstall wine
echo -e "\t\n\t\n" | apt-get -y install wine

clear
echo "=========> MEDIA & COM"
apt-get -y install vlc #video player
apt-get -y install skype
apt-get -y install lightread #RSS Reader
apt-get -y install audacity #Audio record
apt-get -y install shutter #Screenshots
apt-get -y quassel-qt4 #IRC client
apt-get -y install acetoneiso #ISO mounter
apt-get -y install cheese #Webcam manager

clear
echo "=========> NETWORK"
apt-get -y install wireshark #netwok packets watching
apt-get -y install filezilla #FTP Client

clear
echo "=========> GRAPHISM"
apt-get -y install dia-gnome #Graph maker
apt-get -y install inkscape #Vector graphics
apt-get -y install gimp #Graphics
apt-get -y install gcolor2 #Chose color code

clear
echo "=========> DEV UTILITIES"
apt-get -y install git #DVCS
apt-get -y install gitg #Git gui
apt-get -y install subversion #SVN (required by codeblocks svn install)
apt-get -y install doxygen doxygen-gui graphviz #Documentation generator


clear
echo "=========> C/C++ DEV"
apt-get -y install gcc #c compiler
apt-get -y install g++ #c++ compiler
if ls ./install_codeblocks_svn.sh
	then
	./install_codeblocks_svn.sh #Install CB IDE from SVN
	rm -R codeblocks_tmp
else
	apt-get -y install codeblocks #Install CB IDE from debian repos
fi

clear
echo "=========> JAVA DEV"
apt-get -y install eclipse #IDE

clear
echo "=========> Web DEV"
apt-get -y install apache2 #http server
echo -e "$MYSQL_PASSWORD\n$MYSQL_PASSWORD\n" | apt-get -y install mysql-server #DB
apt-get -y install mysql-workbench #GUI for managing MySQL DB
apt-get -y install php5 #PHP Interpreter

apt-get -y install chromium-browser #web browser using WebCore
apt-get -y install konqueror #web browser using Webkit

clear
echo "=========> GNOME SHELL"
apt-get -y install gnome-shell
apt-get -y install gnome-tweak-tool
apt-get -y install gnome-shell-extensions-common #NOT INSTALLED


clear
echo " ///////////////////////////////////////"
echo "O=====================================O/"
echo "|        installation terminée        |/"
echo "|                                     |/"
echo "|         REBOOT NECESSAIRE !         |/"
echo "|                                     |/"
echo "O=====================================O/"


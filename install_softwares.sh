#!/bin/bash

UserInputInstall()
{
	apt-get -y -d install $1
	echo -e "\a";sleep 0.3;echo -e "\a";sleep 0.3;echo -e "\a"
	apt-get -y install $1
}

clear
echo "=========> CHECKING PREREQUIREMENTS"
#telnet github.com 443&
#echo
#if [[ $? == 0 ]]
echo "WARNING: You must have port 3690 (SVN) opened (not blocked by a firewall)"
read

clear
echo "=========> CONFIGURATION"
echo -e "Entrez votre login : "
read USER


clear
echo "=========> ADDING PPA REPOSITORIES"
add-apt-repository -y ppa:gnome3-team/gnome3 #gnome shell
add-apt-repository -y ppa:ricotz/testing #Gnome extensions
add-apt-repository -y ppa:upubuntu-com/chat #Skype
add-apt-repository -y ppa:danielrichter2007/grub-customizer #grub cust
add-apt-repository -y ppa:otto-kesselgulasch/gimp #gimp
gadd-apt-repository -y ppa:cooperjona/lightread #Lightread
clear
echo "=========> UPDATING PACKAGE LIST"
apt-get update

clear
echo "=========> UTILITIES"
apt-get -y install git #DVCS

apt-get -y install zsh #a good shell
	su -l $USER -c "chsh -s /bin/zsh"
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh #install ohmyzsh
chmod ugo+x ./install.sh
	su -l $USER -c "./install.sh"
	exit
	./install.sh
	exit
	rm ./install.sh
	rm -R /root/.oh-my-zsh #delete current root ohmyzsh dir
	ln -s /home/$USER/.oh-my-zsh /root #sym link the user dir
apt-get -y install synaptic
UserInputInstall ubuntu-restricted-extras
apt-get -y install vim
apt-get -y install grub-customizer
apt-get -y install gparted
apt-get -y install p7zip-full
apt-get -y install wine

clear
echo "=========> MEDIA & COM"
apt-get -y install vlc #video player
apt-get -y install skype
apt-get -y install lightread #RSS Reader
apt-get -y install audacity #Audio record
apt-get -y install shutter #Screenshots
apt-get -y install quassel-qt4 #IRC client
apt-get -y install acetoneiso #ISO mounter
apt-get -y install cheese #Webcam manager
apt-get -y install evolution #Calendar

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
UserInputInstall mysql-server
apt-get -y install mysql-workbench #GUI for managing MySQL DB
apt-get -y install php5 #PHP Interpreter

wget http://download.netbeans.org/netbeans/7.2/final/bundles/netbeans-7.2-ml-php-linux.sh #Netbeans IDE
	chmod ugo+x ./netbeans-7.2-ml-php-linux.sh
	echo -e "\a";sleep 0.3;echo -e "\a";sleep 0.3;echo -e "\a"
	./netbeans-7.2-ml-php-linux.sh

apt-get -y install chromium-browser #web browser using WebCore
apt-get -y install konqueror #web browser using Webkit

clear
echo "=========> GNOME SHELL"
apt-get -y install gnome-shell
apt-get -y install gnome-tweak-tool
apt-get -y install gnome-shell-extensions


clear
echo " ///////////////////////////////////////"
echo "O=====================================O/"
echo "|        installation terminée        |/"
echo "|                                     |/"
echo "|         REBOOT NECESSAIRE !         |/"
echo "|                                     |/"
echo "O=====================================O/"


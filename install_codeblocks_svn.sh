mkdir codeblocks_tmp
cd ./codeblocks_tmp

clear
echo "===============> Install GTK from deb repos"
apt-get -y install libgtk2.0-dev
apt-get -y install libwxgtk2.8-dev

clear
echo "===============> install wxGTK from src"
wget http://downloads.sourceforge.net/project/wxwindows/2.8.12/wxGTK-2.8.12.tar.gz
tar zxf wxGTK-2.8.12.tar.gz
#rm wxGTK-2.8.12.tar.gz

clear
echo "Configure wxGTK src" 
cd wxGTK-2.8.12
mkdir build_gtk2_shared_monolithic_unicode
cd build_gtk2_shared_monolithic_unicode
../configure --prefix=/opt/wx/2.8 --enable-xrc --enable-monolithic --enable-unicode

clear
echo "Making wxGTK" 
make -j8
make install

clear
echo "Configuring wxGTK" 
export PATH=/usr/bin:/opt/wx/2.8/bin:$PATH

echo "/opt/wx/2.8/lib" >> /etc/ld.so.conf
ldconfig
source /etc/profile

cd ../../


clear
echo "===============> install codeblocks from svn"
echo "Get src"
apt-get -y install subversion
svn checkout svn://svn.berlios.de/codeblocks/trunk
cd trunk

clear
echo "Install needed packages"
apt-get -y install libtdl-dev
apt-get -y install autoconf
apt-get -y install libhunspell-dev
apt-get -y install libgamin-dev

clear
echo "Configure codeblocks src"
./bootstrap
clear
./configure --with-contrib-plugins=AutoVersioning,BrowseTracker,byogames,Cccc,CppCheck,cbkoders,codesnippets,codestat,copystrings,Cscope,DoxyBlocks,dragscroll,EditorConfig,EditorTweaks,envvars,FileManager,headerfixup,help,hexeditor,incsearch,keybinder,libfinder,MouseSap,profiler,regex,ReopenEditor,exporter,spellchecker,symtab,ThreadSearch,ToolsPlus,Valgrind,wxcontrib,wxsmith,wxsmithcontrib,wxsmithaui

clear
echo "Making Codeblocks" 
make -j8
make install

clear
echo "Configuring codeblocks"
echo "/usr/local/lib" >> /etc/ld.so.conf
ldconfig


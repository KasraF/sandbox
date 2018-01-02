# Add necessary signatures
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410;

# Add necessary Apt repositories
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list;
sudo add-apt-repository -y ppa:ubuntu-elisp/ppa;
sudo add-apt-repository -y ppa:graphics-drivers/ppa;
sudo add-apt-repository -y ppa:mozillateam/firefox-next;
sudo add-apt-repository -y ppa:libreoffice/ppa;
sudo add-apt-repository -y ppa:snwh/pulp;
sudo add-apt-repository -y ppa:tista/adapta;


# Update and install Apt applications
sudo apt-get update;
sudo apt-get upgrade -y;
sudo apt-get install -y gnome texlive-full emacs-snapshot vlc git clang llvm paper-icon-theme paper-cursor-theme moc moc-ffmpeg-plugin network-manager-*-gnome cmake pkg-config git libao-dev libasound2-dev libavcodec-dev libavformat-dev libbluetooth-dev libenet-dev libgtk2.0-dev liblzo2-dev libminiupnpc-dev libopenal-dev libpulse-dev libreadline-dev libsfml-dev libsoil-dev libsoundtouch-dev libswscale-dev libusb-1.0-0-dev libwxbase3.0-dev libwxgtk3.0-dev libxext-dev libxrandr-dev portaudio19-dev zlib1g-dev libudev-dev libevdev-dev "libpolarssl-dev|libmbedtls-dev" libcurl4-openssl-dev libegl1-mesa-dev libpng-dev qtbase5-private-dev exfat-utils wine-development adapta-gtk-theme lightdm spotify-client gimp blender;

# Fix GRUB
sudo cp -f ./grub /etc/default/grub;
sudo update-grub;

# Setup Git
git config --global user.name  "Kasra Ferdowsifard";
git config --global user.email "kferdowsifard@gmail.com";
git config credential.helper   'store';

# Setup Emacs
cp -f ./.emacs ~/;

# Own /opt
sudo chown kas /opt;

# Install manual applications
cd /opt;

# Install Popcorn Time
mkdir "popcorn-time";
cd popcorn-time;
wget http://mirror01.popcorntime.sh/build/Popcorn-Time-0.3.10-Linux-64.tar.xz;
tar -xvf Popcorn-Time-0.3.10-Linux-64.tar.xz;
rm -f Popcorn-Time-0.3.10-Linux-64.tar.xz;
cd ../;

# Install IntelliJ
wget https://download.jetbrains.com/idea/ideaIU-2017.3.2.tar.gz;
tar -xvzf ideaIU-2017.3.2.tar.gz;
rm ideaIU-2017.3.2.tar.gz;

# Install PyCharm
wget https://download.jetbrains.com/python/pycharm-professional-2017.3.2.tar.gz;
tar -xvzf pycharm-professional-2017.3.2.tar.gz;
rm pycharm-professional-2017.3.2.tar.gz;

# Install Tor
wget https://www.torproject.org/dist/torbrowser/7.0.11/tor-browser-linux64-7.0.11_en-US.tar.xz;
tar -xvf tor-browser-linux64-7.0.11_en-US.tar.xz;
rm tor-browser-linux64-7.0.11_en-US.tar.xz;

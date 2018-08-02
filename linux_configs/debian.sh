#
# This is a script that sets up most of my Debian configurations for new OS installs.
# Make sure you run from within the directry it is in.
#

# Update and upgrade
echo "Updated and Upgrade from Aptitude";
(sudo apt-get update && \
sudo apt-get upgrade -y && \
sudo apt-get autoremove -y) || (echo "Could not update aptitude" && exit 1);

# Install the basic applications
# TODO Add the libraries needed to build emacs
sudo apt-get install git make cmake vlc \
# Alacritty libraries
libfreetype6-dev libfontconfig1-dev xclip \
# TODO Emacs libraries
|| exit 1;

# Install and update Rust
curl https://sh.rustup.rs -sSf | sh;
rustup update;

# Get the applications we build from source

# Alacritty
mkdir ~/source &&
cd ~/source || (echo "Failed to create sources directory" && exit 1);
git clone https://github.com/jwilm/alacritty;
cd alacritty;
git checkout scrollback;
cargo install --force;

# TODO Emacs

# Copy the emacs configs
cp ./.emacs ~/.emacs;

# Append the update script to bashrc
echo"
update()
{
	sudo apt-get update &&
	sudo apt-get upgrade -y &&
	sudo apt-get autoremove -y;
	rustup update;
	cd ~/source/alacritty;
	git pull;
	rustup install --force;
	cd ~/source/emacs;
	git pull;
	./configure # TODO add the correct flags
	make -j 8;
	sudo make install;
}" >> ~/.bashrc

exit 0;

readonly BASE_PKGS="dialog cryptsetup lvm2 mdadm"
readonly X_PKGS="$BASE_PKGS xorg-minimal xorg-input-drivers xorg-video-drivers setxkbmap xauth font-misc-misc terminus-font dejavu-fonts-ttf alsa-plugins-pulseaudio intel-ucode"
readonly DWM_PKGS="$X_PKGS xorg-fonts libX11-devel libXft-devel fontconfig-devel libXinerama-devel xinit font-inconsolata-otf font-libertine-otf font-awesome xinit arandr noto-fonts-emoji font-symbola xclip xdotool xdpyinfo xdpyinfo xsetroot xset pam xss-lock xsecurelock compton dmenu feh pywal tabbed xtools lf calcurse libnotify dbus dunst sxiv neovim mpd mpc mpv ncmpcpp newsboat sc-im htop unrar unzip p7zip youtube-dl zathura zathura-djvu zathura-pdf-mupdf poppler mediainfo mediainfo atool fzf simple-mtpfs bash-completion zsh zsh-syntax-highlighting neomutt transmission scrot qrencode pamixer pulsemixer firefox steam lutris gnuplot base-devel clang tcc python python3 python3-pip ninja gromit-mpx wxMaxima octave"

# Enable 32bit repos
sudo xbps-install -Sy void-repo-multilib

# Install nonfree repos and add option to install restricted packages
sudo xbps-install -Sy void-repo-nonfree
sudo xbps-install -Sy void-repo-multilib-nonfree
sudo echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf

sudo xbps-install -S $DWM_PKGS

readonly TMPDIR=$(mktemp --tmpdir="$(pwd -P)" -d)

mkdir $HOME/razvoj
mkdir $HOME/prenosi
mkdir $HOME/slike
mkdir $HOME/videoposnetki
mkdir $HOME/namizje
mkdir $HOME/glasba
mkdir $HOME/dokumenti
mkdir $HOME/šola

git clone https://github.com/ckbr0/dwm.git $TMPDIR/dwm
make -C $TMPDIR/dwm install

git clone https://github.com/ckbr0/st.git $TMPDIR/st
make -C $TMPDIR/st install

# Dotfiles
git clone https://github.com/ckbr0/linuxrice.git $TMPDIR/dotfiles
sudo rm -r $TMPDIR/dotfiles/.git
cp -rf $TMPDIR/dotfiles/. $HOME/

# Wallpapers
mkdir $HOME/slike/ozadja
git clone https://github.com/ckbr0/ozadja.git $HOME/slike/ozadja
sudo rm -rf $HOME/slike/ozadja/.git

./$HOME/.local/bin/updatewal $HOME/slike/ozadja

sudo rm -r $TMPDIR

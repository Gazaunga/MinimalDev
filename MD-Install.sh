packages=(
  connman-gtk
  termite
  rofi-git
  polybar-git
  sddm
  i3gaps-git
  i3status-git
  i3lock-fancy-git
  nitrogen
  compton
  terminator
  nerd-fonts-git
  bumblebee-status-git
  neovim
  python-neovim
  python2-neovim
  ruby-neovim
  emacs
  otf-hermit
  ttf-hack
  typora
  file-roller
  zathura
  zathura-pdf-mupdf
  zathura-cb
  zathura-ps
  zathura-djvu
  imagemagick
  dunst
  keepassx2
  scrot
  redshift
  wpa_supplicant
  ttf-raleway
)
pacaur -S --noconfirm --noedit ${packagelist[@]}

# fancy
cd ~
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
curl -sLf https://spacevim.org/install.sh | bash
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
wget https://raw.githubusercontent.com/Gazaunga/SpaceOS/master/.spacemacs

# sddm
cd ~
sudo systemctl enable sddm.service
git clone https://github.com/Eayu/sddm-theme-clairvoyance
#sudo vim /etc/sddm.conf
#set "Current" to "clairvoyance"

cd $HOME/MinimalDev
ruby mv.rb

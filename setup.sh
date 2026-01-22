#!/bin/bash

# checks
if [[ $EUID -ne 0 ]]; then
  echo "this script must be run as root"
  exit 1
fi
export SUSER=$(grep ":1000:" /etc/passwd | cut -d: -f1)
if [ -z $SUSER ]; then
  echo "must create user (uid 1000) to continue"
  exit 1
fi

# setup apt/repos changes
apt update; apt install gnupg curl -y

sed -i 's/non-free-firmware/non-free-firmware contrib non-free/g' /etc/apt/sources.list

curl -fsSL https://debian.griffo.io/EA0F721D231FDD3A0A17B9AC7808B4DD62C41256.asc \
  | gpg --dearmor -o /usr/share/keyrings/debian.griffo.io.gpg

echo "deb [signed-by=/usr/share/keyrings/debian.griffo.io.gpg] \
  https://debian.griffo.io/apt $(lsb_release -sc) main" \
  | tee /etc/apt/sources.list.d/debian.griffo.io.list
  
apt install extrepo -y; extrepo enable librewolf; echo 'APT::Default-Release "stable";' > /etc/apt/apt.conf

cat << EOF > /etc/apt/preferences
Package: *
Pin: release o=Debian,a=unstable
Pin-Priority: 10

EOF

# install all required packages
apt update; apt install sudo budgie-desktop thunar flatpak vim-nox gufw ufw shotwell mpv transmission-gtk lightdm htop \
slick-greeter git papirus-icon-theme solaar galculator breeze-cursor-theme system-config-printer cups librewolf ghostty \
gparted blueman network-manager budgie-weathershow-applet budgie-quicknote-applet arc-theme fonts-noto yubikey-manager \
fastfetch mousepad xarchiver plymouth atril gnome-calendar libavcodec-extra ttf-mscorefonts-installer gstreamer1.0-libav \
gstreamer1.0-plugins-ugly firmware-misc-nonfree network-manager-applet geary gdebi unrar -y


# install plymouth
export PATH=$PATH:/usr/sbin
git clone https://github.com/remmiculous/simplefuture /usr/share/plymouth/themes/simplefuture
sed -i 's/quiet/quiet splash/g' /etc/default/grub
sed -i 's/Theme=ceratopsian/Theme=simplefuture/g' /usr/share/plymouth/plymouthd.defaults
update-grub; update-initramfs -u -k all

# setup login dm
sed -i 's/^#greeter-session=.*$/greeter-session=slick-greeter/g' /etc/lightdm/lightdm.conf
rm /usr/share/xsessions/lightdm-xsession.desktop
/usr/sbin/adduser $SUSER sudo
cat << EOF > /etc/lightdm/slick-greeter.conf
[Greeter]
theme-name=Arc
icon-theme-name=Papirus
cursor-theme-name=Breeze_Light
background=/usr/share/images/desktop-base/ghibli_kodamas.png

EOF

# fetch config/theme
rm -rf /home/$SUSER/.config; su $SUSER -c 'git clone https://github.com/dgv/ombian -b dotfiles /home/$SUSER/.config'
mv /home/$SUSER/.config/*.png /usr/share/images/desktop-base/
su $SUSER -c 'dconf load / < ~/.config/dconf.backup'

echo "setup done. rebooting..."
sleep 3
/usr/sbin/reboot

# setup flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# flatpaks to install
cat << EOF > /tmp/flatpaks
com.discordapp.Discord
com.system76.Popsicle
io.ente.photos
md.obsidian.Obsidian
io.github.astralvixen.geforce-infinity
com.vscodium.codium
cc.arduino.IDE2
EOF

# install each one
while read pkg; do
  flatpak install $pkg -y
done  < /tmp/flatpaks

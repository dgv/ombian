# ombian

## motivation

I miss the old days running Lubuntu with LXDE (old one, not LXQT), a lite desktop environment on stable linux distribution, nowadays most distributions require 4GB of RAM, any GNOME/KDE plasma environment consumes ~1.5GB of RAM, LXDE/QT or IceWM became clunky/clumsy, XFCE not support tiling natively, Zorin Lite was deprecated and not support arm64, also don't wanna go full on tiling environments using sway or hyprland...

expectations
- ~900MB memory footprint
- tiling support
- dark/light theme
- familiar UI/shortcuts etc (from win/macos)

requirements
- debian 13 (trixie)
- amd64 device
- 2GB of RAM 
- 6GB of disk space

## boot (simple plymouth theme)
![boot](/boot.png)

## login (lightdm using slick-greeter)
![login](/login.png)

## desktop (budgie desktop environment)
![desktop](/desktop.png)

![fastfetch](/fastfetch.png)

## default apps
![default](/default.png)

## another apps

- text editor: mousepad 
- calculator: galculator
- terminal: ghostty
- document viewer: atril
- tools: xarchiver (archive manager), solaar (logitech dev manager), ykman (yubikey manager), gparted (disk partitions), transmission (p2p), gufw (firewall)...

## installation

Just install debian as usual, on software selection choose `SSH server` and `standard system utilities`, then after first reboot run as root:

```bash
wget -O - http://dgv.dev.br/ombian/setup.sh | bash
```

## bonus

Some flatpaks apps
- Arduino IDE
- VSCodium: hardened VSCode 
- Popsicle: USB flasher
- GeForce(NOW) Infinity: Access games platforms
- Discord
- Obsidian
- Ente Photos

```bash
wget -O - https://dgv.dev.br/ombian/flatpaks.sh | bash
```


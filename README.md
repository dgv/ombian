# ombian

## motivation

I miss the old days running Lubuntu with LXDE (old one, not LXQT), a lite desktop environment on stable linux distribution, nowadays most distributions require 4GB of RAM, any GNOME/KDE plasma environment consumes ~1.5GB of RAM, LXDE/QT or IceWM became clunky/clumsy, XFCE not support tiling natively, Zorin Lite was deprecated and not support arm64, also don't wanna go full on tiling environments using sway or hyprland...

expectations
- ~700MB memory footprint
- tiling support
- dark/light theme
- familiar UI/shortcuts etc (from win/macos)

requirements
- debian 13 (trixie) or armbian
- amd64 or aarch64 device
- 2GB of RAM 
- 5GB of disk space

## boot (simple plymouth theme)
![boot](/boot.png)

## login (lightdm using slick-greeter)
![login](/login.png)

## desktop (mate desktop environment)
![desktop](/desktop.png)

![fastfetch](/fastfetch.png)

## default apps

- Web browser: LibreWolf
- Mail Reader: Geary
- Image Viewer: Eye 
- Media Player: mpv
- Text Editor: Pluma
- Terninal: MATE Terminal
- File Manager: Caja
- Calculator: MATE Calc
- Doc Viewer: Atril
- Word Processor: AbiWord
- Spreadsheet: Gnumeric

## extra capababilities

- manage logitech devices using solaar
- ready for mobile internet connection via usb
- added non-free repos

## installation

Just install debian as usual, on software selection choose `SSH server` and `standard system utilities`, then after first reboot run as root:

```bash
wget -O - https://dgv.dev.br/ombian/setup.sh | bash
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

Development tools 

```bash
wget -O - https://dgv.dev.br/ombian/dev.sh | bash
```

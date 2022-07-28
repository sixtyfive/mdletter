# How to use

1. make a copy of this repository and `cd` into it
2. put either a "cv.md" or "letter.md" file (see "examples" directory) here (or both)
3. type `make`

# Troubleshooting

Make sure the name of each ".md" file matches with the name of a HTML file from the "templates" directory.

# Prerequisites

Requires the following in reasonably recent versions:
- GNU Make
- Pandoc
- Google Chrome

## ArchLinux-based distributions

```
pacman -Syu base-devel pandoc google-chrome-stable
```

## Debian-based distributions

```
sudo apt update && sudo apt install build-essential pandoc
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt -f install
```

## Solus Linux

```
sudo eopkg it -c system.devel
sudo eopkg it pandoc
sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/network/web/browser/google-chrome-stable/pspec.xml
sudo eopkg it google-chrome-*.eopkg;sudo rm google-chrome-*.eopkg
```

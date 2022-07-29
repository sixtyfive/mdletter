# How to use

1. make a copy of this repository and `cd` into it
2. put one or both of the ".md" files from the examples directory there
3. type `make`

# Troubleshooting

Make sure the name of each ".md" file matches with the name of a HTML file from the "templates" directory. If you want to create a different document type, you'll have to add a new template for it.

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

# Why?

Because life is too short to learn LaTeX properly and I'm still not willing to start using a WYSIWYG software for correspondence and other needs. Yes, there are similar projects, but I liked different ideas from different people, so here's mine. Also, I wanted a pipeline that uses Markdown together with HTML/CSS templates compiled to HTML using Pandoc and then compiled to PDF using Chromium's headless mode.

Other people's work I looked at and which might interest you as well:

- https://www.heise.de/select/ct/2018/7/1522040433200990
  (https://github.com/jamct/panTexter)
- https://github.com/elipapa/markdown-cv
- https://github.com/mac-and-i/Normbrief-mit-Markdown
- https://github.com/mszep/pandoc_resume
- https://github.com/aaronwolen/pandoc-letter

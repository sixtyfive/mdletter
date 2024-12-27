# How?

```sh
wget https://github.com/sixtyfive/mdletter/archive/refs/heads/main.zip -O mdletter.zip
unzip mdletter.zip
mv mdletter-main "Letter to Marge and Homer"
cd "Letter to Marge and Homer"
```

Now use your favorite text editor to edit one (or more) of the [Markdown](https://commonmark.org/help/) (`*.md`) files found in the `examples` folder and save it/them (keeping the name(s)!) directly in the "Letter to Marge and Homer" directory.

```sh
rake # or make
```

The Makefile only has `all` and `clean` tasks and is provided in case rake is not available. The Rakefile has some creature comforts, such as trying to detect a working Chrom(e|ium) binary. To list available tasks, `rake -T`.

# Why?

Because life is too short to learn LaTeX properly and I'm still not willing to start using a WYSIWYG software for correspondence and other needs. Yes, there are similar projects, but I liked different ideas from different people, so here's mine. Also, I wanted a pipeline that uses Markdown together with HTML/CSS templates compiled to HTML using Pandoc and then compiled to PDF using Chromium's headless mode.

# Troubleshooting

Make sure the name of each `.md` file matches with the name of a folder in `templates`. If you want to create a different document type, you'll have to add a new template for it.

If you get an error such as `unexpected "("`, make sure your `Pandoc` version is sufficiently up-to-date. At the time of this writing, 3.6.1 has just been released.

Problems with converting HTML to PDF via Chromium (or Chrome) are unfortunately often down to them having changed their command line options. Please don't hesitate to file an Issue so I can look into it.

# Prerequisites

- [rake](https://ruby.github.io/rake/) (or [make](https://www.gnu.org/software/make/); I kept the Makefile when I wrote the Rakefile)
- [Pandoc](https://pandoc.org/) for converting the Markdown to HTML
- [Chromium](https://www.chromium.org/getting-involved/download-chromium/) or Google Chrome, only if you wish to convert the HTML into a PDF as well

# Similar Projects

- https://github.com/jamct/panTexter (also see https://www.heise.de/select/ct/2018/7/1522040433200990)
- https://github.com/elipapa/markdown-cv
- https://github.com/mac-and-i/Normbrief-mit-Markdown
- https://github.com/mszep/pandoc_resume
- https://github.com/aaronwolen/pandoc-letter

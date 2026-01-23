# Randy's Cyber Survival Guide
I made this as a "cookbook" of sorts, taking clear inspiration from the [*Blue Team Field Manual*](https://www.goodreads.com/book/show/33941100-blue-team-field-manual-btfm) and other resources similar. My eventual goal is to get this in a more or less indexed state where I can easily print it out and have it handy whenever I do cyber threat hunting, DFIR, and other fun stuff.
**LAST UPDATED:** `22 Jan 2026`
## Accessing This Book
There are three ways to access this book: via **GitHub Pages**, downloading the **HTML archive**, or downloading the **PDF book**.

> **GitHub Pages**
> 
> Access the online book here: https://randy-halim.github.io/cyber-survival-guide/

**HTML/PDF Archive**

1. Go to the workflow run: https://github.com/randy-halim/cyber-survival-guide/actions/workflows/build-and-archive.yml
2. Select the latest successful workflow run
3. Scroll to the bottom and download the wanted artifacts. There is one with the HTML site (can serve using your own webserver) and one with the PDF.
## Building This Book
This book is using **MkDocs** with the Material theme installed.

- `mkdocs` with `mkdocs-material` theme.
- `mkdocs-callouts` and `mkdocs-roamlinks-plugin` for Obsidian compatibility.
- `mkdocs-with-pdf` for PDF generation (using WeasyPrint).

If you want to modify this for yourself, follow these general steps:

1. Clone this repo
2. Open in Obsidian
3. edit ??? profit
4. To build the book, use one of the following methods:
```bash
# method 1: local python environment
# (Recommended) use a virtual environment
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

# build the site (HTML only)
mkdocs build

# build with PDF
export ENABLE_PDF_EXPORT=1
mkdocs build
```

```bash
# method 2: docker container
# builds the site inside the container
docker run --rm -v $(pwd):/docs -w /docs ghcr.io/randy-halim/mdbook-custom:latest mkdocs build
```

## Helper Container
I made a [helper container](https://github.com/randy-halim/cyber-survival-guide/pkgs/container/mdbook-custom) which now uses Python 3-slim and includes all necessary dependencies for building the site and PDF (including WeasyPrint libs).

```bash
docker pull ghcr.io/randy-halim/mdbook-custom:latest
```

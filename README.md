# Randy's Cyber Survival Guide
I made this as a "cookbook" of sorts, taking clear inspiration from the
[*Blue Team Field Manual*](https://www.goodreads.com/book/show/33941100-blue-team-field-manual-btfm)
et. al. My eventual goal is to get this in a more or less indexed state where I can easily print it out
and have it handy whenever I do cyber threat hunting, DFIR, and other fun stuff.

**LAST UPDATED:** `17 Jan 2026`


## Accessing This Book
There are three ways to access this book: via **this repo's Pages**, downloading the **HTML archive**,
or downloading the **PDF book**.

**Repo Pages**
Access the online book here: https://randy-halim.github.io/cyber-survival-guide/

**HTML/PDF Archive**
1. Go to the workflow run: https://github.com/randy-halim/cyber-survival-guide/actions/workflows/build-and-archive.yml
2. Select the latest successful workflow run
3. Scroll to the bottom and download the wanted artifacts. There is one with the HTML site (can serve using your own webserver) and one with the PDF.


## Building This Book
I used the following toolchain when building this book so far:
- `mdbook` provided by Rust: https://github.com/rust-lang/mdBook
- `mdbook-pdf` to produce a PDF version of the book: https://github.com/HollowMan6/mdbook-pdf
- ~~`mdbook-indexing` as a preprocessor to add an index to the book: https://github.com/daviddrysdale/mdbook-indexing~~ I haven't tried this yet.
- Obsidian as my editor of choice (although `vim` works in a pinch for quick edits!): https://obsidian.md
- `obsidian-export` for translating most Obsidian-specific Markdown to normal Markdown

If you want to modify this for yourself, follow these general steps:
1. Clone this repo
2. Open in Obsidian
3. edit ??? profit
4. To build the book, either install the dependencies yourself (plus Chrome/Chromium/something else), or use the container:

```bash
# method 1: directly on machine
# make sure you have Chromium or similar installed
cargo install mdbook mdbook-pdf mdbook-indexing obsidian-export
bash ./build-book.sh

# method 2: docker container
docker run --rm -it -v ./:/tmp/repo ghcr.io/randy-halim/mdbook-custom:latest /bin/bash -c 'cd /tmp/repo && bash /tmp/repo/build-book.sh'
```


## Helper Container
I made a [helper container](https://github.com/randy-halim/cyber-survival-guide/pkgs/container/mdbook-custom)
with all the dependencies pre-installed for simplicity. The only drawback is that the container size, mostly
due to the need for Chromium installed (not Chromium Headless)

```bash
docker pull ghcr.io/randy-halim/mdbook-custom:latest
```

# Randy's Cyber Survival Guide
I made this as a "cookbook" of sorts, taking clear inspiration from the [*Blue Team Field Manual*](https://www.goodreads.com/book/show/33941100-blue-team-field-manual-btfm) et. al. My eventual goal is to get this in a more or less indexed state where I can easily print it out and have it handy whenever I do cyber threat hunting, DFIR, and other fun stuff.

**LAST UPDATED:** `9 December 2025`

## Building This Book
I used the following toolchain when building this book so far:
- `mdbook` provided by Rust: https://github.com/rust-lang/mdBook
- `mdbook-compress` for building PDFs: https://github.com/v-nxe/mdbook-compress
- Obsidian as my editor of choice (although `vim` works in a pinch for quick edits!): https://obsidian.md

If you want to modify this for yourself, follow these general steps:
1. Install Rust, and install the `mdbook*` crates with `cargo install mdbook mdbook-compress`
2. Clone this repo
3. Open in Obsidian
4. ??? profit
5. To build the book, it should be as simple as running `mdbook build` in the root directory. Book files will show up in `./book/`

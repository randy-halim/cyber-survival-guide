#!/bin/bash

## A simple Bash script to preprocess Obsidian's specific Markdown syntax
## to standard Markdown, then builds using `mdbook`.
## 
## Requires these to be installed: mdbook, obsidian-export

rm -r src-build/
mkdir -p src-build/
obsidian-export src/ src-build/
mdbook build
rm -r src-build/


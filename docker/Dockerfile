FROM rust:1.92-slim

RUN apt-get update && apt-get install -y chromium
RUN cargo install mdbook mdbook-indexing mdbook-pdf obsidian-export

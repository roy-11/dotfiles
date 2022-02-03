#!/usr/bin/env zsh

echo "\n<<< Starting Rust Setup >>>\n"

# Rust インストール
if [ -e ~/.cargo/bin ]; then
  echo "Rust has already installed"
else
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
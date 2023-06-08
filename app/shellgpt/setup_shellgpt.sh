#!/usr/bin/env zsh

echo "\n<<< Starting shell-gpt Setup >>>\n"

# shellgpt インストール
if [ -e $(pyenv root)/shims/sgpt ]; then
  echo "shell-gpt has already installed"
else
  pip install shell-gpt==0.9.0
fi

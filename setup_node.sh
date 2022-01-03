#!/usr/bin/env zsh

echo "\n<<< Starting Node Setup >>>\n"

# プラグインインストール
if [ -e "$(nodenv root)"/plugins/nodenv-package-rehash ]; then
    echo "nodenv-package-rehash already exists"
else
    git clone https://github.com/nodenv/nodenv-package-rehash.git "$(nodenv root)"/plugins/nodenv-package-rehash
fi

# node インストール
if [ -e "$(nodenv root)"/versions/16.13.1 ]; then
    echo "node has already installed"
else
    nodenv install 16.13.1
    nodenv global 16.13.1
fi

# Install Global NPM Packages
npm install -g yarn

echo "Global NPM Packages Installed:"
npm list -g --depth=0

# 設定反映
nodenv rehash
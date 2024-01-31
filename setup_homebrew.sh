#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

# Homebrew インストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# GUIゲートキーパーのスキップ設定
export HOMEBREW_CASK_OPTS="--no-quarantie"

# Brewfileのインストール
brew bundle --verbose

# 自動起動するようにする
brew services start autoraise # カーソルをウインドウにずらすと自動フォーカス

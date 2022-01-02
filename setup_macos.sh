#!/usr/bin/env zsh

# *Finder関連
defaults write com.apple.finder ShowPathbar -bool true # パスを表示
defaults write com.apple.finder ShowStatusBar -bool true    # ステータスバーを表示
defaults write com.apple.finder ShowTabView -bool true    # タブバーを表示

# *トラックパッド
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true # 三本指ドラッグ

# *スクリーンショット関連
mkdir -p "$HOME/Screenshots" # フォルダを作成
defaults write com.apple.screencapture location "$HOME/Screenshots" # 作成したフォルダに保存
defaults write com.apple.screencapture type jpg # デフォルトのpngからjpgにする

# 再起動
killall Finder
killall Dock
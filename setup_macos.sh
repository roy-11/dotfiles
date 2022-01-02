#!/usr/bin/env zsh

echo "\n<<< Starting MacOS Setup >>>\n"

# *Finder
defaults write com.apple.finder ShowPathbar -bool true # パスを表示
defaults write com.apple.finder ShowStatusBar -bool true # ステータスバーを表示
defaults write com.apple.finder ShowTabView -bool true # タブバーを表示
defaults write com.apple.finder FXPreferredViewStyle Nlsv # リストで表示

# *トラックパッド
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true # タップでクリック
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true # タップでクリック
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0 # 四本指でスワイプ
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true # 三本指ドラッグ
defaults write -g com.apple.trackpad.scaling -int 2.5 # カーソルの移動速度を速くする
defaults write -g com.apple.trackpad.scrolling -string "0.4412" # カーソルの移動速度を速くする

# *キーボード
defaults write NSGlobalDomain KeyRepeat -int 2 # キーリピートの速度を最速にする
defaults write NSGlobalDomain InitialKeyRepeat -int 25 # キーリピートの認識までの時間を早くする

# *メニューバー
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss" # 時計に秒を含め表示
defaults write com.apple.menuextra.clock ShowSeconds -bool true # 時計に秒を含め表示
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool true # サウンドを表示

# *ドック
defaults write com.apple.dock tilesize -int 60 # ドックのサイズ
defaults write com.apple.dock autohide -bool true # 自動的に非表示

# *スクリーンショット
mkdir -p "$HOME/Screenshots" # フォルダを作成
defaults write com.apple.screencapture location "$HOME/Screenshots" # 作成したフォルダに保存
defaults write com.apple.screencapture type jpg # デフォルトのpngからjpgにする

# 手動実行
# sudo nvram StartupMute=%01 起動音をミュートにする

# 再起動
killall Finder
killall Dock
killall SystemUIServer
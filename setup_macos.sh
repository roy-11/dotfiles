#!/usr/bin/env zsh

echo "\n<<< Starting MacOS Setup >>>\n"

# *Finder
defaults write com.apple.finder ShowPathbar -bool true # パスを表示
defaults write com.apple.finder ShowStatusBar -bool true # ステータスバーを表示
defaults write com.apple.finder ShowTabView -bool true # タブバーを表示
defaults write com.apple.finder FXPreferredViewStyle Nlsv # リストで表示
defaults write com.apple.finder DisableAllAnimations -boolean true # Finderのファイルを開くときのアニメーションを無効
defaults write -g QLPanelAnimationDuration -float 0 # クイックルック時のアニメーションを無効

# *トラックパッド
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true # タップでクリック
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true # タップでクリック
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true # 三本指ドラッグ
defaults write -g com.apple.trackpad.scaling -int 2.5 # カーソルの移動速度を速くする
defaults write -g com.apple.trackpad.scrolling -string "0.4412" # カーソルの移動速度を速くする
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0 # 四本指でスワイプ→BBTでyabaiを使用した遷移に変更

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
defaults write com.apple.dock autohide-delay -float 0 # カーソルをドック位置に移動してからドックの表示時間を0秒にする
defaults write com.apple.dock autohide-time-modifier -float 0.15 # ドックの表示/非表示になる時間を0.15秒にする

# *Mission Control
defaults write com.apple.dock expose-animation-duration -float 0.1 # MissonControlのアニメーション時間を0.1秒にする
defaults write com.apple.dock workspaces-edge-delay -float 0.2; # スペースの切り替えを早くする

# *Launchpad
defaults write com.apple.dock springboard-show-duration -float 0 # アニメーションを無効
defaults write com.apple.dock springboard-hide-duration -float 0 # アニメーションを無効
defaults write com.apple.dock springboard-page-duration -float 0 # アニメーションを無効

# *スクリーンショット
mkdir -p "$HOME/Screenshots" # フォルダを作成
defaults write com.apple.screencapture location "$HOME/Screenshots" # 作成したフォルダに保存
defaults write com.apple.screencapture type jpg # デフォルトのpngからjpgにする

# *その他
defaults write com.apple.PowerChime ChimeOnNoHardware -bool true # 充電時の音をミュートにする
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO # ウインドウアニメーションを無効にする
defaults write -g NSWindowResizeTime 0.001 # ウィンドウのサイズ変更を早くする 
defaults write -g NSScrollAnimationEnabled -bool false # カーソルホバー時のツールチップ情報の表示を早くする
defaults write com.apple.dashboard mcx-disabled -boolean true # ダッシュボード機能（時計・天気などガジェット表示）を無効にする

# 手動実行
# sudo nvram StartupMute=%01 起動音をミュートにする
# vimacインストール https://github.com/dexterleng/vimac

# 再起動
killall PowerChime
killall Finder
killall Dock
killall SystemUIServer

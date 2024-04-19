#!/usr/bin/env fish

echo "\n<<< Starting Fishshell Setup >>>\n"

# シェルをfish shellに変更
if grep -Fxq '/opt/homebrew/bin/fish' '/etc/shells'        
  echo '/opt/homebrew/bin/fish already exists in /etc/shells'
else
  echo "Enter superuser (sudo) password to edit /etc/shells"
  echo ''\n'/opt/homebrew/bin/fish' | sudo tee -a '/etc/shells' > /dev/null
  echo "Enter superuser (sudo) password to change shell to fish"
  chsh -s /opt/homebrew/bin/fish
end

# Fisher インストール
if [ -e ~/.config/fish/functions/fisher.fish ]
    echo "fisher has already installed"
else
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
end

# プラグインインストール
fisher install jethrokuan/z
fisher install PatrickF1/fzf.fish

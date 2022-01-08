#!/usr/bin/env zsh

echo "\n<<< Starting jman Setup >>>\n"

# コメントアウト・書き換え
if grep -E "^JNROFF /usr\/bin\/groff -Dutf8 -Tutf8 -mandoc -mja -E$" /etc/man.conf >/dev/null; then
  echo New JNROFF exist.
else
  sudo sed -i -e "s/^JNROFF[( ))(	)][( ))(	)]*\/usr\/bin\/groff -Tnippon -mandocj -c$/# &\nJNROFF \/usr\/bin\/groff -Dutf8 -Tutf8 -mandoc -mja -E/" /etc/man.conf
fi

if grep -E "^PAGER /usr/bin/less -isr$" /etc/man.conf >/dev/null; then
  echo New PAGER exist.
else
  sudo sed -i -e "s/^PAGER[( ))(	)][( ))(	)]*\/usr\/bin\/less -is$/# &\nPAGER \/usr\/bin\/less -isr/" /etc/man.conf
fi

if grep -E "^BROWSER /usr/bin/less -isr$" /etc/man.conf >/dev/null; then
  echo New BROWSER exist.
else
  sudo sed -i -e "s/^BROWSER[( ))(	)][( ))(	)]*\/usr\/bin\/less -is$/# &\nBROWSER \/usr\/bin\/less -isr/" /etc/man.conf
fi

# 日本語訳のインストール
cd ~/Downloads || exit
curl -O http://linuxjm.osdn.jp/man-pages-ja-20211215.tar.gz
tar xfz man-pages-ja-20211215.tar.gz
cd man-pages-ja-20211215 || exit
make config
make install

# install folder: /opt/homebrew/share/man/
# uname of page owner [root] ?: mac username
# group of page owner [root] ?: admin
#!/usr/bin/env zsh

echo "\n<<< Starting Python Setup >>>\n"

# python インストール
if [ -e "$(pyenv root)"/versions/3.10.6 ]; then
    echo "python has already installed"
else
    pyenv install 3.10.6
    pyenv global 3.10.6
fi

# poetry インストール
if [ -e $HOME/.poetry ]; then
    echo "poetry has already installed"
else
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
fi

# jupyterの実行
# poetry install
# poetry run jupyter notebook <path>

# nvimのcocエラー対応
# [coc.nvim] Error on execute :pyx command, ultisnips feature of coc-snippets requires pyx support on vim.
# pip install pynvim

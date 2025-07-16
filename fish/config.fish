# 共通設定
source ~/.aliases
source ~/.variables

# グリーティングメッセージを無効
set -U fish_greeting

# homebrew
eval (/opt/homebrew/bin/brew shellenv)

# nodenv
eval (nodenv init - | source)

# pyenv
eval (pyenv init - | source)

# fzf
fzf --fish | source
fzf_configure_bindings --processes=\cp

# the fuck
thefuck --alias fk | source

if status is-interactive
    # starship
    starship init fish | source
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# Added by LM Studio CLI (lms)
set -gx PATH $PATH $HOME/.lmstudio/bin
# End of LM Studio CLI section

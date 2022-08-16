# 共通設定
source ~/.aliases
source ~/.variables

# homebrew
eval (/opt/homebrew/bin/brew shellenv)

# nodenv
eval (nodenv init - | source)

# pyenv
eval (pyenv init - | source)

if status is-interactive
    # starship
    starship init fish | source
end

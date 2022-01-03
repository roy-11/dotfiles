# 共通alias
source ~/.alias

# homebrew
eval (/opt/homebrew/bin/brew shellenv)

# nodenv
eval (nodenv init - | source)

if status is-interactive
    # Commands to run in interactive sessions can go here
end

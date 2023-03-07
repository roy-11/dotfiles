ide() {
  tmux split-window -v
  tmux split-window -h
  tmux resize-pane -D 15
  tmux select-pane -t 0
}

michi() {
  tmux split-window -h
  tmux split-window -h
  tmux select-pane -t 0
  tmux split-window -v
}

tree() {
  exa --tree --level=$1 --no-filesize --no-user --no-time --no-permissions -I "node_modules" -F
}

gl() {
  num=${1:-5}
  git log --oneline -n $num
}

"$@"

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

"$@"

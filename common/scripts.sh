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
	eza --tree --level=$1 --no-filesize --no-user --no-time --no-permissions -I "node_modules" -F
}

gl() {
  num=${1:-5}
  git log --oneline -n $num
}

_fzf_compgen_path() {
	fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
	fd --type=d --hidden --exclude .git . "$1"
}

"$@"

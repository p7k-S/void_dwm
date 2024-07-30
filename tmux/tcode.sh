tmux new -s code -d
tmux new-window -t code
tmux split-window -h -t code
tmux select-window -t "1"
tmux send-keys -t code 'sf' Enter
tmux attach -t code

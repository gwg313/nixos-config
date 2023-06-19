#!/bin/bash

not_in_tmux() {
  [ -z "$TMUX" ]
}

DIR="$1"

# If no arguments are passed in, try to immediately attach or start without further input
echo "$DIR"
if [ -z "$DIR" ]; then
  if not_in_tmux; then
    tmux attach && exit 1 || DIR="--start"
  else
    exit 1
  fi
fi

# If --start was passed in, immediately start a new session based on the current directory
if [ "$DIR" = "--start" ]; then
  echo "Starting"
  path_name="$(basename "$PWD" | tr . -)"
  session_name="${path_name//./_}"
else
  # Ask the user which directory to start in
  _session_name=$(cd "$DIR" && find -L . -maxdepth 1 -type d -printf "%f\n" | sed "s|/||g" | fzf --reverse --header="Select project from $(basename "$DIR") >")
  session_name="${_session_name//./_}"
  path_name="$DIR/$_session_name"
fi

echo "Session name is \"$session_name\""
echo "Path name is \"$path_name\""

if [ -z "$session_name" ]; then
  # Operation cancelled by user
  exit 1
fi

session_exists() {
  # Check if the $session_name exists
  tmux has-session -t "=$session_name"
}

create_detached_session() {
  if [ "$DIR" = "--start" ]; then
    (TMUX='' 
    tmux new-session -Ad -s "$session_name" -c "$path_name"
    )
  else
    (TMUX=''
    tmux new-session -Ad -s "$session_name" -c "$path_name"
    tmux split-window -vb -t "$session_name" -c "$path_name" -p 70
    tmux send-keys -t "$session_name" "nvim '+Telescope find_files'" Enter
    )
  fi
}

create_if_needed_and_attach() {
  if not_in_tmux; then
    tmux new-session -As "$session_name" -c "$path_name"
  else
    if ! session_exists; then
      create_detached_session
    fi
    tmux switch-client -t "$session_name"
  fi
}

attach_to_first_session() {
  first_session_name=$(tmux list-sessions -F "#{session_name}" | head -n 1)
  if [ -n "$first_session_name" ]; then
    tmux attach -t "$first_session_name"
    tmux choose-tree -Za
  fi
}

create_if_needed_and_attach || attach_to_first_session

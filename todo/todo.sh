#!/usr/bin/env bash

todo() {
  local TODAY_TODO=$HOME/Desktop/todos/$(date +%d.%m.%Y).txt
  local YESTERDAY_TODO=$HOME/Desktop/todos/$(date -v -1d '+%d.%m.%Y').txt
  local TODO_DIRECTORY=$HOME/Desktop/todos

  # if today's TODO doesn't exist
  if [ ! -f ${TODAY_TODO} ]; then

    # if yesterday's TODO exists
    if [ -f ${YESTERDAY_TODO} ]; then
      # copy over yesterday's TODO conents into today's TODO
      cp ${YESTERDAY_TODO} ${TODAY_TODO}
    else
      # copy over the template file as today's TODO
      cp $HOME/TODO-TEMPLATE.txt ${TODO_DIRECTORY}
      # rename the copied file to formatting corresponding to today's TODO
      mv ${TODO_DIRECTORY}/TODO-TEMPLATE.txt ${TODAY_TODO}
    fi
  fi

  nano "$HOME/Desktop/todos/$(date +%d.%m.%Y).txt"
}
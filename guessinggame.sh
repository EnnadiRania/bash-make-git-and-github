#!/usr/bin/env bash

# Guess the number of regular files in the current directory.
set -u

count_files() {
  find . -maxdepth 1 -type f -print | wc -l | tr -d '[:space:]'
}

read_guess() {
  printf 'How many files are in the current directory? '
  IFS= read -r guess || return 1
  while [[ ! "$guess" =~ ^[0-9]+$ ]]; do
    printf 'Please enter a non-negative whole number.\n'
    printf 'How many files are in the current directory? '
    IFS= read -r guess || return 1
  done
}

target=$(count_files)
printf 'Guess the number of files in the current directory.\n'

while true; do
  if ! read_guess; then
    printf '\nInput ended before a correct guess was entered.\n'
    exit 1
  fi

  if (( guess < target )); then
    printf 'Your guess is too low. Try again.\n'
  elif (( guess > target )); then
    printf 'Your guess is too high. Try again.\n'
  else
    printf 'Congratulations! You guessed the correct number of files: %s\n' "$target"
    break
  fi
done

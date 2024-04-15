#!/bin/bash

# Function to generate a random move for the computer
generate_computer_move() {
  moves=("r" "p" "s")
  computer_move=${moves[$RANDOM % ${#moves[@]}]}
}

# Function to get the player's move
get_player_move() {
  echo "Please enter your move (r, p, or s)"
  read player_move
  player_move=$(echo $player_move | tr '[:upper:]' '[:lower:]')
  while [[ ! $player_move =~ ^(r|p|s)$ ]]; do
    echo "Invalid move. Please enter your move (r, p, or s)"
    read player_move
    player_move=$(echo $player_move | tr '[:upper:]' '[:lower:]')
  done
}

# Function to determine the winner
determine_winner() {
  if [[ $player_move == $computer_move ]]; then
    echo "The game was a tie"
  elif ([[ $player_move == "r" && $computer_move == "s" ]] || \
        [[ $player_move == "p" && $computer_move == "r" ]] || \
        [[ $player_move == "s" && $computer_move == "p" ]]); then
    echo "You win!"
  else
    echo "You lose!"
  fi
}

# Main game loop
while true; do
  generate_computer_move
  get_player_move
  echo "Computer played: $computer_move"
  determine_winner
  echo "Play again? (y/n)"
  read play_again
  if [[ $play_again != "y" ]]; then
    break
  fi
done

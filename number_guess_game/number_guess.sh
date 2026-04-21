#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN_MENU() {
  echo "Enter your username:"
  read USER_NAME
  RESULT=$($PSQL "SELECT total_games, best_game FROM users WHERE name='$USER_NAME'")
  if [[ -z $RESULT ]]
  then
    echo "Welcome, $USER_NAME! It looks like this is your first time here."
  else
    IFS="|" read GAMES_PLAYED BEST_GAME <<< "$RESULT"
    echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
  RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))
  echo "Guess the secret number between 1 and 1000:"
  ROUNDS=1
  read USER_GUESS
  
  while [[ $USER_GUESS != $RANDOM_NUMBER ]]
  do
    while [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    do
      echo "That is not an integer, guess again:"
      read USER_GUESS
    done

    if [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    fi
    ROUNDS=$((ROUNDS+1))
    read USER_GUESS
  done
  
  if [[ -z $RESULT ]]
  then
    ADD_RESULTS=$($PSQL "INSERT INTO users(name, total_games, best_game) VALUES ('$USER_NAME', 1, $ROUNDS)")
  else
    if [[ $ROUNDS -lt $BEST_GAME ]]
    then
      ADD_BEST_GAME=$($PSQL "UPDATE users SET best_game=$ROUNDS WHERE name='$USER_NAME'")
    fi
  
    GAMES_PLAYED=$((GAMES_PLAYED+1))
    ADD_TOTAL_GAMES=$($PSQL "UPDATE users SET total_games=$GAMES_PLAYED WHERE name='$USER_NAME'")
  fi
  
  echo "You guessed it in $ROUNDS tries. The secret number was $RANDOM_NUMBER. Nice job!"
}



MAIN_MENU

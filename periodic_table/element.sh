#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN_MENU() {
  #if input is empty
  if [[ -z $1 ]]
  then
    echo Please provide an element as an argument.
  else
    #if input is not a number
    if [[ ! $1 =~ ^[0-9]+$ ]]
    then
      INPUT=$1
      QUERY_DATABASE_TEXT $INPUT
    else
      ATOMIC_NUMBER=$1
      QUERY_DATABASE_NUMBER
    fi
  fi
}

QUERY_DATABASE_NUMBER() {
  RESULT=$($PSQL "SELECT e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type 
  FROM properties AS p INNER JOIN elements AS e USING(atomic_number) INNER JOIN types AS t USING(type_id)
  WHERE e.atomic_number=$ATOMIC_NUMBER")

  if [[ -z $RESULT ]]
  then
    echo I could not find that element in the database.
  else
    IFS="|" read ATOMIC_SYMBOL ATOMIC_NAME ATOMIC_MASS MELTING_POINT BOILING_POINT ELEMENT_TYPE <<< "$RESULT"
    echo "The element with atomic number $ATOMIC_NUMBER is $ATOMIC_NAME ($ATOMIC_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $ATOMIC_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
}

QUERY_DATABASE_TEXT() {
  #echo $INPUT
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$INPUT'")
  #if not a symbol
  if [[ -z $ATOMIC_NUMBER ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$INPUT'")
  fi

  if [[ -z $ATOMIC_NUMBER ]]
    then
      echo I could not find that element in the database.
    else
      QUERY_DATABASE_NUMBER
  fi
}

MAIN_MENU $1

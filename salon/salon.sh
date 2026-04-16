#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  
  LIST_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  while IFS="|" read SERVICE_ID SERVICE
  do
    ID=$(echo "$SERVICE_ID" | sed -E 's/ *$|^ *//g')
    NAME=$(echo "$SERVICE" | sed -E 's/ *$|^ *//g')
    echo "$ID) $NAME"
  done <<< "$LIST_SERVICES"

  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
    return
  fi

  VALID_SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  if [[ -z $VALID_SERVICE ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
    return
  else
    PROCESS_SERVICE
  fi
}

PROCESS_SERVICE() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  IS_PHONE_NUMBER_IN=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -E 's/ *$|^ *//g')

  if [[ -z $IS_PHONE_NUMBER_IN ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -E 's/ *$|^ *//g')
    INSERT_NAME_PHONE_STATUS=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  CUSTOMER_ID=$(echo $CUSTOMER_ID | sed -E 's/ *$|^ *//g' )
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  SERVICE_NAME=$(echo $SERVICE_NAME | sed -E 's/ *$|^ *//g')
  
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  return
}

MAIN_MENU

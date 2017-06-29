#!/bin/bash

CHROME_LS_PATH="$HOME/Library/Application Support/Google/Chrome/Default/Local Storage/chrome-extension_ancbofgphhmhcchnaognahmjfajaecmo_0.localstorage"
JAXX_LS_PATH="$HOME/Library/Application Support/Jaxx/Local Storage/file__0.localstorage"

echo "Password:"
read -s PASSWORD
echo "Repeat Password:"
read -s PASSWORD2

PASSWORD_HASH=`echo "$PASSWORD" | openssl dgst -sha256`

if [ $PASSWORD != $PASSWORD2 ]
then
  echo "Passwords do not match"
  exit 1
fi

if [ ! -f "$CHROME_LS_PATH"  ]
then
  echo "Jaxx Chrome extension not found!"
else
  echo "$PASSWORD_HASH" > "$CHROME_LS_PATH.hash"
  openssl aes-128-cbc -salt -in "$CHROME_LS_PATH" -out "$CHROME_LS_PATH.safe" -k "$PASSWORD" && rm "$CHROME_LS_PATH"
fi

if [ ! -f "$JAXX_LS_PATH"  ]
then
  echo "Jaxx Desktop not found!"
else
  echo "$PASSWORD" > "$JAXX_LS_PATH.hash"
  openssl aes-128-cbc -salt -in "$JAXX_LS_PATH" -out "$JAXX_LS_PATH.safe" -k "$PASSWORD" && rm "$JAXX_LS_PATH"
fi


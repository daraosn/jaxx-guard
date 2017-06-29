#!/bin/bash

CHROME_LS_PATH="$HOME/Library/Application Support/Google/Chrome/Default/Local Storage/chrome-extension_ancbofgphhmhcchnaognahmjfajaecmo_0.localstorage"
JAXX_LS_PATH="$HOME/Library/Application Support/Jaxx/Local Storage/file__0.localstorage"

echo "Password:"
read -s PASSWORD

PASSWORD_HASH=`echo "$PASSWORD" | openssl dgst -sha256`

echo $PASSWORD_HASH
CHROME_FILE_HASH=`cat "$CHROME_LS_PATH.hash"`
JAXX_FILE_HASH=`cat "$JAXX_LS_PATH.hash"`

if [ $PASSWORD_HASH != $CHROME_FILE_HASH ]
then
  echo "Wrong password for Jaxx Chrome Extension!"
else
  openssl aes-128-cbc -d -salt -in "$CHROME_LS_PATH.safe" -out "$CHROME_LS_PATH" -k "$PASSWORD"
  rm "$CHROME_LS_PATH.safe"
  rm "$CHROME_LS_PATH.hash"
fi

if [ $PASSWORD_HASH != $JAXX_FILE_HASH ]
then
  echo "Wrong password for Jaxx Desktop!"
else
  openssl aes-128-cbc -d -salt -in "$JAXX_FILE_HASH.safe" -out "$JAXX_FILE_HASH" -k "$PASSWORD"
  rm "$JAXX_FILE_HASH.safe"
  rm "$JAXX_FILE_HASH.hash"
fi

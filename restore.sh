#!/bin/bash

CHROME_LS_PATH="$HOME/Library/Application Support/Google/Chrome/Default/Local Storage/chrome-extension_ancbofgphhmhcchnaognahmjfajaecmo_0.localstorage"
JAXX_LS_PATH="$HOME/Library/Application Support/Jaxx/Local Storage/file__0.localstorage"

echo "Password:"
read -s PASSWORD

PASSWORD_HASH=`echo "$PASSWORD" | openssl dgst -sha256`

echo $PASSWORD_HASH
FILE_HASH=`cat "$CHROME_LS_PATH.hash"`

if [ $PASSWORD_HASH != $FILE_HASH ]
then
  echo "Wrong password for Jaxx Chrome Extension!"
else
  openssl aes-128-cbc -d -salt -in "$CHROME_LS_PATH.safe" -out "$CHROME_LS_PATH" -k "$PASSWORD"
  rm "$CHROME_LS_PATH.safe"
  rm "$CHROME_LS_PATH.hash"
fi

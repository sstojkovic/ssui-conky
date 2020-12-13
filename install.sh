#!/bin/bash

folder=~/.conky/ssui

echo "Installing begins"
if [[ -d ${folder} ]]
then
  read -p "Override ${folder}? (y/n): " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    echo "Installing canceled..."  
    exit
  fi
else
  mkdir $folder
fi

echo "Installing..."
cp -r * $folder
chmod +x $folder/start.sh
echo "Installing done"
exit
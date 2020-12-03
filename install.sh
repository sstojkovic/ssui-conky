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
  else
    rm -r ${folder}
  fi
fi

echo "Installing..."
mkdir $folder
cp -r * $folder
chmod +x $folder/start.sh
echo "Installing done"
exit
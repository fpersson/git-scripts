#!/bin/bash

DEVELOPMENT=~/development
USERNAME="<your name>"

if [ "$1" == "" ]
then
  echo "usage git-bitbucket <project-name>"
  exit 1;
fi

if [ -d $DEVELOPMENT/$1 ]
then
  echo "project allready exist, exit git-bitbucket.sh"
  exit 1;
fi

mkdir -p $DEVELOPMENT/$1
cd $DEVELOPMENT/$1

touch .gitignore
touch README.md
echo "TODO edit this README.md" > README.md
git init
git add .
git commit -a -m "Init commit for $1"

echo "Password"
read -s PASSWORD

curl --user $USERNAME:$PASSWORD https://api.bitbucket.org/1.0/repositories/ --data name=$1 --data is_private='true'
echo "\n"
git remote add origin https://$USERNAME@bitbucket.org/$USERNAME/$1.git
git push -u origin --all

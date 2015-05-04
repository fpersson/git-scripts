#!/bin/bash

DROPBOX=~/Dropbox/repos
DEVELOPMENT=~/development
NAME=$(git config --global --get user.name)

if [ "$1" == "" ]
then
  echo "usage git-dropbox <project-name>"
  exit 1;
fi

if [ -d $DEVELOPMENT/$1 ]
then
  echo "project allready exist, exit git-dropbox.sh"
  exit 1;
fi

mkdir -p $DEVELOPMENT/$1
cd $DEVELOPMENT/$1

touch .gitignore
touch README.md
git init
git add .
git commit -a -m "Init commit for $1"

HERE=$(pwd)
mkdir -p $DROPBOX/$1.git
cd $DROPBOX/$1.git
git --bare init
echo "$1" > description
echo "[gitweb] owner = \"$NAME\"" >> config
cd $HERE

git remote add origin $DROPBOX/$1.git
git push origin master
#!/bin/bash

DEVELOPMENT=~/development
USERNAME="<your name>"

if [ "$1" == "" ]
then
  echo "usage git-github <project-name>"
  exit 1;
fi

if [ -d $DEVELOPMENT/$1 ]
then
  echo "project allready exist, exit git-github.sh"
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

curl -u $USERNAME https://api.github.com/user/repos -d '{"name":"'$1'"}'

git remote add origin https://github.com/$USERNAME/$1.git
git push -u origin master
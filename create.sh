#!/bin/bash
if [ $# -lt 1 ]
then
   echo "Specify a folder name"
   exit 1
fi

FOLDER_NAME="$1"

if [ -d $FOLDER_NAME ]
then
   echo "Folder already exists: $FOLDER_NAME"
   exit 1
fi

set -e

mkdir $FOLDER_NAME
cd $FOLDER_NAME

echo "Copying index.html"
cp ../.shared/template/index.html .

echo "Setting up symlinks"
ln -s ../.shared/reveal/css css
ln -s ../.shared/reveal/js/ js
ln -s ../.shared/reveal/lib/ lib
ln -s ../.shared/reveal/plugin plugin

echo "Done"
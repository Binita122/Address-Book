#!/bin/sh

doindent()
{
  # Do a small indent depending on how deep into the tree we are
  # Depending on your enviroment, you may need to use

    j=0;
    while [ "$j" -lt "$1" ]; do
      echo -en "  " 
      j=`expr $j + 1`
    done
}

traverse() 
{
  # Traverse a directory
  cd "$1"

  ls | while read i
  do
    doindent $2
    if [ -d "$i" ]; then
      echo "Directory: $i"
     
      (traverse "$i" `expr $2 + 1`)
    else 
      echo "File: $i"
    fi
  done
}

if [ -z "$1" ]; then
  traverse . 0
else
  traverse "$1" 0
fi

#!/bin/sh

doindent()
{
  # Do a small indent depending on how deep into the tree we are
  
    j=0;
    while [ "$j" -lt "$1" ]; do
      echo -en "  " 
      j=`expr $j + 1`
    done
}

traverse() 
{
  # Traverse a directory:wq
  indent="$2"

  ls "$1" | while read i
  do
    doindent $2
    if [ -d "$1/$i" ]; then
      echo "Directory: $1/$i"
      
      traverse "$1/$i" `expr $2 + 1`
    else 
      echo "File: $1/$i"
    fi
  done
}

if [ -z "$1" ]; then
  traverse . 0
else
  traverse "$1" 0
fi

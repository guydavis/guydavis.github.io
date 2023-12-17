#!/bin/bash
x=1
while [ $x -le 10 ]
do
  image=$(ls img/headers/ | sort -R | tail -1)
  grep -q $image _posts/*.markdown
  if [[ $? != 0 ]]; then
    echo $image
    exit 0
  fi
  x=$(( $x + 1 ))
done
echo "Couldn't find a single unused header image.  Add some more!"

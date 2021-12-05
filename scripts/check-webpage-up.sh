#!/bin/bash

if [ $# -ne 1 ]; then
	echo "USAGE: $0 url"
	exit 1
fi

if [ $# -eq 2 ]; then
	alarm=$2
else
	alarm="https://www.youtube.com/watch?v=SkA-J_ETw4I"   # "ala a tomar por culo video"
fi

echo "Checking for connection in background"
echo "We will let you know"

(
 while true; do
	if [ $(curl -LI "$1" -o /dev/null -w '%{http_code}\n' -s) -eq 200 ]; then 
		brave "$alarm"
		exit 0
  	fi
done
)&  # make execute in bg


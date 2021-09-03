#!/usr/bin/env zsh
filetype=$1
filepath=$2
params=$@

echo "Execution of $filetype $filepath"
echo "================================"
case $filetype in
 bash)
    bash $filepath $params
   ;;

 zsh | sh)
    zsh $filepath $params
   ;;

 python | python3) 
    python3 $filepath $params
   ;;

 *)
   echo -n "unknown"
   ;;
esac
echo "================================"

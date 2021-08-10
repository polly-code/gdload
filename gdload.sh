#!/bin/bash

## Author(s): Pavel Kos
## Contact: pavel.kos@fmi.ch
## This software is distributed without any guarantee under the terms of the GNU General
## Public License, either Version 2, June 1991 or Version 3, June 2007.

if [ $1 = "-h" ]; then
echo "The script download the file from Google Drive(R)."
echo "The 1st argument is the entire googledrive link. The 2nd argument is the desired filename."
echo "Example: gdload.sh https://drive.google.com/file/d/1PDkIwupm8r2kORsuS8H7u0SJ9kd_D01s/view?usp=sharing testfile.dat"
echo "Make sure that file can be downloaded by anyone having the link. In case of problems, try to rerun the script :)"
echo "@kpi"
exit 1
fi
part1=`dirname "$1"`
FILLED=`basename "$part1"`
echo $FILLED
echo $2
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id='"$FILLED"'' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=$FILLED" -O $2 && rm -rf /tmp/cookies.txt &
wait

#!/bin/bash
dataDir=data/
while read uri; do
    wget $uri
    filename=${uri##*/*/}
    tablesPartDir=${filename%%.*}
    echo ${filename##*.}
    if [ "${filename##*.}" = "csv" ]
    then
        mv $filename $dataDir
    else
        mkdir -p $dataDir/$tablesPartDir
        tar -xvf $filename -C $dataDir/$tablesPartDir
        rm $filename
    fi
done < goldstandarduri.list

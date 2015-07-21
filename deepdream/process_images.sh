#!/bin/bash

while [ true ];
do
cd /opt/deepdream/inputs
find . -type f -not -path '*/\.*' -print0 | while read -d $'\0' f;
do
    cd /opt/deepdream
    touch outputs/$f-log.txt
    ./make_json.sh
    ./process_images_once.sh $f 2>&1 > outputs/$f-log.txt
    ./make_json.sh
    sleep 1
done
done

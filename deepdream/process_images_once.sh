#!/bin/bash -x

f=$1
    cd /opt/deepdream
    if [ ! -e outputs/${f} ];
    then
	echo "Deepdream" ${f}
	chmod gou+r inputs/${f}
	cp inputs/${f} input.jpg
	pwd
	date
	which python
	python deepdream.py
	ERROR_CODE=$?
	echo "Error Code is" ${ERROR_CODE}
	cp output.jpg outputs/${f}
	rm output.jpg
	echo "Just created" outputs/${f}
    fi



#!/bin/bash
# Simple script to process all of the images inside the inputs/ folder
# We will be running this script inside the visionai/clouddream Docker image
# Copyright vision.ai, 2015

f=$1
    cd /opt/deepdream
    if [ ! -e outputs/${f} ];
    then
	echo "Deepdream" ${f}
	chmod gou+r inputs/${f}
	cp inputs/${f} input.jpg
	python deepdream.py
	ERROR_CODE=$?
	echo "Error Code is" ${ERROR_CODE}
	cp output.jpg outputs/${f}
	rm output.jpg
	echo "Just created" outputs/${f}
    fi



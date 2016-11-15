#!/bin/bash
PWD=`pwd -P`
#while [ true ];do
#	sleep 45m
	i=5
#	while [ $i != "0" ];do
		sec=60
		convert $PWD/rest.jpeg  -font "DroidSans" -pointsize 200 \
			          -draw "gravity  north\

				   fill yellow   \
				-anonat	 -50,70 'hello world' \ 
						                     " \
								               /tmp/rest.jpeg
		feh -xFZ /tmp/rest.jpeg

#	done
#done

#!/bin/bash


	
for i in {seq  1 $1}

do	
	nombre=$(sed -n"$RANDOM"p array)	
	echo $nombre
	curl -L  https://source.unsplash.com/random/900%C3%97700/?person --output $nombre
	sleep 1
done

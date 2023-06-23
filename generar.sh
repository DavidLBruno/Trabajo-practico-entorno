#!/bin/bash
	
for i in {1..$1}
do
        random=$(($RANDOM/100))
	nombre=$(sed -n "$random"p array)
	curl -L https://source.unsplash.com/random/900%C3%97700/?person --output $nombre
	sleep 1
done

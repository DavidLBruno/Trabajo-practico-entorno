#!/bin/bash


# Download image with a for
mkdir images
for i in $(seq 1 "$1")
do
	nombre=$(sed -n "$RANDOM"p array)
	cd images
	curl -L https://source.unsplash.com/random/900%C3%97700/?person --output "$nombre"
	cd ..
	sleep 1
done

cd images
zip ../images *
cd ..

hash=$(md5sum images.zip)

touch images.zip.sum

echo $hash > images.zip.sum

echo Todo salio correctamente

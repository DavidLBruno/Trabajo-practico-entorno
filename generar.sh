#!/bin/bash


# Download image with a for
mkdir -p images

if [[ ! -e array.txt ]]
then
	curl -L https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv --output array.txt
fi

for i in $(seq 1 "$1")
do
	number=$(($RANDOM%$(wc -l < ./array.txt)))
	nombre=$(sed -n "$number"p array.txt)
	echo $i $nombre $number AAAAAAAAAA
	cd images
	curl -L https://source.unsplash.com/random/900%C3%97700/?person --output "$(echo $nombre | cut -d , -f 1)"
	cd ..
	sleep 1
done

cd images
zip ../images *
cd ..

hash=$(md5sum images.zip)

touch images.zip.sum

echo $hash > images.zip.sum

echo Imagenes generadas correctamente!

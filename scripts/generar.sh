#!/bin/bash

# Download image with a for
mkdir -p /app/images

if [[ ! -e /app/array.txt ]]
then
    curl -L https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv --output /app/array.txt
fi

for i in $(seq 1 "$1")
do
    number=$(($RANDOM%$(wc -l < /app/array.txt)))
    nombre=$(sed -n "$number"p /app/array.txt)
    cd /app/images
    curl -L https://source.unsplash.com/random/900%C3%97700/?person --output "$(echo $nombre | cut -d , -f 1)"
    cd -
    sleep 1
done

cd /app/images
zip /app/images.zip *
cd ..

hash=$(md5sum /app/images.zip)
touch /app/images.zip.sum
echo $hash > /app/images.zip.sum

echo Imagenes generadas correctamente! $(ls)


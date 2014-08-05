#!/bin/bash
cd ~/Sites/ykra/hiRes
FILES=`ls`
echo $FILES

if ! [ -a lowRes ] 
	then
		echo "Folder lowRes not found, creating it"
		mkdir lowRes
fi

for f in $FILES 
	do
		if [ -f $f ] 
			then 
				echo "Processing $f"
				sips -Z 1280 $f --out lowRes/$f
		fi
	done

	echo "All images were resized to 1280"
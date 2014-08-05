#!/bin/bash
cd "$1"
FILES=``
if ! [ -a lowRes ] 
	then
		echo "Folder lowRes not found, creating it"
		mkdir lowRes
fi
find "$1" -type f | while read f ; do
	if [ -f "$f" ] 
		then 
			FILENAME=`basename "$f"`
			echo "Processing "$FILENAME" to "lowRes/$FILENAME""

			sips -Z 1280 "$f" --out "lowRes/$FILENAME"
	else
		echo "Skipping $f"
	fi
done

echo "All images were resized to 1280"
exit
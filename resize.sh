#!/bin/bash
cd images;
FILES=``

if ! [ -a mobile ]
	then
		echo "Folder mobile not found, creating it"
		mkdir mobile
fi
if ! [ -a desktop ]
	then
		echo "Folder desktop not found, creating it"
		mkdir desktop
fi

i=0;
rm mobile/*
rm desktop/*

ls | while read f ; do
	if [ -f "$f" ]
		then
			FILENAME=`basename "$f"`
			echo "Processing "$FILENAME""
			convert "$FILENAME" -resize 1600x -strip "desktop/$FILENAME"
			convert "$FILENAME" -resize 600x -strip "mobile/$FILENAME"

			# mogrify -path "desktop" -filter Triangle -define filter:support=2 -thumbnail 1600 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB "$FILENAME"
			# mogrify -path "mobile" -filter Triangle -define filter:support=2 -thumbnail 600 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB "$FILENAME"
			i=$((i+1))
	else
		echo "Skipping $f"
	fi
done

echo "$i images resized"
exit

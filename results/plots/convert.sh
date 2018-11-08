#!/usr/bin/env bash
for d in "training with most dissimilar samples" "training with most similar samples"
do
	echo "$d"
	cd "$d"
	for s in "structural similarity" "sequence similarity"
	do
		echo "$s"
		cd "$s"
		for f in "X-Score" "Vina" "Cyscore"
		do
			echo "$f"
			cd "$f"
			for m in "RP" "RS" "RMSE"
			do
				echo "$m"
				convert -density 600 -trim $m.pdf $m.png
				#convert -density 600 -trim -compress lzw $m.pdf $m.tiff
			done
			cd ..
		done
		cd ..
	done
	cd ..
done

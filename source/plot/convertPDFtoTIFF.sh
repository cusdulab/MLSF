#!/usr/bin/env bash
for s in "structural similarity" "sequence similarity"
do
	echo "$s"
	cd "$s"
	for d in "training with most dissimilar samples" "training with most similar samples"
	do
		echo "$d"
		cd "$d"
		for f in "X-Score" "Vina" "Cyscore"
		do
			echo "$f"
			cd "$f"
			for m in "RMSE" "RP" "RS"
			do
				echo "$m"
				convert -density 600 -compress lzw -trim $m.pdf $m.tiff
			done
			cd ..
		done
		cd ..
	done
	cd ..
done

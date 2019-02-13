#!/usr/bin/env bash
for d in "training with most dissimilar samples" "training with most similar samples"
do
	echo "$d"
	cd "$d"
	for s in "structural similarity" "sequence similarity" "ligand similarity"
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
#				convert -density 600 -trim -compress lzw $m.pdf $m.tiff
			done
			cd ..
		done
		for m in "RP" "RS" "RMSE"
		do
			echo "$m"
			convert X-Score/$m.png Vina/$m.png Cyscore/$m.png -append $m.png # -append specifies vertical merging.
		done
		cd ..
	done
	for m in "RP" "RS" "RMSE"
	do
		echo "$m"
		convert "structural similarity"/$m.png "sequence similarity"/$m.png "ligand similarity"/$m.png +append $m.png # +append specifies horizontal merging.
	done
	cd ..
done

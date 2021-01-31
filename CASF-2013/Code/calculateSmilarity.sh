#==================================#
#Usage:
#       sh calculateSmilarity.sh train.csv core-iy.csv 2013
#==================================#

train_text=$1
test_text=$2
version=$3

#============================== protein ==============================#

for train_i in `cat ${train_text}`
do

	title_name=`echo ${train_i} | awk -F"," '{print $1}'`
	printf "$title_name%s\t" >> $version/Protein_Structure_Similarity.csv
done
printf "%s\n"

for test_i in `cat ${test_text}`
do
	test_name=`echo ${test_i} | awk -F"," '{print $1}'`

	printf "$test_name%s\t" >> $version/Protein_Structure_Similarity.csv

	for train_i in `cat ${train_text}`
	do
		train_name=`echo ${train_i} | awk -F"," '{print $1}'`
		TM_Sore_Protein=`./../MMalign/MMalign $train_name/$train_name"_protein.pdb" $test_name/$test_name"_protein.pdb" | head -12 | tail -n+11 | awk -F"," '{print $3}' | awk -F"=" '{print $2}'`
		printf "$TM_Sore_Protein%s\t" >> $version/Protein_Structure_Similarity.csv
	done

	printf "%s\n" >> $version/Protein_Structure_Similarity.csv

done

#============================== ligand ==============================#
for file in `awk -F"," '{print $1}' ${test_text}`
do
	cat $version/$file/$file"_ligand.sdf" >> $version"_ligand"/all_test_ligand.sdf
	
done

for i in `awk -F"," '{print $1}' ${train_text}`
do
	babel $version/$i/$i"_ligand.smi" v2013_all_test_ligand.sdf -ofpt -xfFP4 > $version/$i.smilarity.csv
done

printf " %s\t" >> $version/Ligand_Similarity_ECFP4.csv
for i in `awk -F"," '{print $1}' ${test_text}`
do
	printf "$i%s\t" >> $version/Ligand_Similarity_ECFP4.csv
done
printf "%s\n" >> $version/Ligand_Similarity_ECFP4.csv

for j in `ls $version/*.smilarity.csv`
do

	name=${j%%.*}
	printf "$name%s\t" >> $version/Ligand_Similarity_ECFP4.csv
	for score in `tail -n+2 $j | awk -F"=" '{print $2}'`
	do
		 printf "$score%s\t" >> $version/Ligand_Similarity_ECFP4.csv
	done
	printf "%s\n" >> $version/Ligand_Similarity_ECFP4.csv

done


#============================== pocekt ==============================#
for i in `cat ${train_text} ${test_text} | awk -F"," '{print $1}'`
do
	obabel $version/$i/$i"_pocket.pdb" -o mol2 > /home/jessiesze/protein_Similarity/v2013/$i/$i"_pocket.mol2"
	TopMap-SD/TopMap_v0.1linux_x86_64/TopMap_v0.1linux $version/$i/$i"_pocket.mol2"
done

for test in `awk -F"," '{print $1}' ${test_text}`
do
	cat $version/$test/$test"_pocket.dat" >> $version/TopMap/dat/$test"_train.dat"

	for train in `awk -F"," '{print $1}' ${train_text}`
	do
		cat $version/$train/$train"_pocket.dat" >> $version/TopMap/dat/$test"_train.dat"
	done
done

for i in `ls $version/TopMap/dat`
do
	name=${i%.*}
	python TopMap-SD/dssmlrty_cmp_minima.py 1 2766 $version/TopMap/dat/$i > $version/TopMap/result/$name
	head -n-1 $version/TopMap/result/$name | tail -n+3 | awk -F"/" '{print $(NF-1)}' > $version/TopMap/result/a
	head -n-1 $version/TopMap/result/$name | tail -n+3 | awk -F" " '{print $2}' > $version/TopMap/result/b
	paste -d"\t" $version/TopMap/result/a $version/TopMap/result/b > $version/TopMap/result/$name".csv"
	sort -n -k1 $version/TopMap/result/$name".csv" > $version/TopMap/result/$name"_sort.csv"
	rm $version/TopMap/result/a $version/TopMap/result/b $version/TopMap/result/$name".csv"
done

printf " %s\t" >> $version/Pocket_Similarity_TopMap.csv
for i in `awk -F"," '{print $1}' ${test_text}`
do
	printf "$i%s\t" >> $version/Pocket_Similarity_TopMap.csv
done
printf "%s\n" >> $version/Pocket_Similarity_TopMap.csv

for train in `awk -F"," '{print $1}' ${train_text} | sort -n -k1`
do
	printf "$train%s\t" >> $version/Pocket_Similarity_TopMap.csv

	for test in `awk -F"," '{print $1}' ${test_text}`
	do
		grep "$train" $version/TopMap/result/$test"_train_sort.csv" | awk -F"\t" '{printf $2"\t"}' >> $version/Pocket_Similarity_TopMap.csv
	done
	printf "%s\n" >> $version/Pocket_Similarity_TopMap.csv

done


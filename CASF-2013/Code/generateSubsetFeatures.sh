#!/bin/bash

#=============================================================#
# sh generateSubsetFeatures.sh ${folder}
#=============================================================#

folder=$1

#===================================================================================#

for traincut in `ls data/${folder}`
do
	printf "Y,VDW,HB,HP,HM,HS,RT%s\n" >> XscoreResult/$folder/Xscore_$traincut
	printf "Y,Hydrophobic,Vdw,HBond,Ent%s\n" >> CyscoreResult/$folder/Cyscore_$traincut
	printf "Y,gauss1,gauss2,repulsion,hydrophobic,Hydrogen,Nrot%s\n" >> VinaResult/$folder/Vina_$traincut
	printf "Y,Hydrophobic,Vdw,HBond,Ent,VDW,HB,HP,HM,HS,RT,gauss1,gauss2,repulsion,hydrophobic,Hydrogen,Nrot%s\n" >> Cy_Xscore_VinaResult/$folder/Cy_Xscore_Vina_$traincut
	for i in `awk -F"," '{print $1}' data/$folder/$traincut`
	do
		y=`grep ${i} XscoreResult/Xscore_trainResult_2016.csv | awk -F"," '{print $2}'`
		printf "$y," >> XscoreResult/$folder/Xscore_$traincut
		printf "$y," >> CyscoreResult/$folder/Cyscore_$traincut
		printf "$y," >> VinaResult/$folder/Vina_$traincut
		printf "$y," >> Cy_Xscore_VinaResult/$folder/Cy_Xscore_Vina_$traincut

		grep ${i} XscoreResult/Xscore_trainResult_2016.csv | awk -F"," '{print $3","$4","$5","$6","$7","$8}' >> XscoreResult/$folder/Xscore_$traincut
		grep ${i} CyscoreResult/Cyscore_trainResult_2016.csv | awk -F"," '{print $3","$4","$5","$6}' >> CyscoreResult/$folder/Cyscore_$traincut
		grep ${i} VinaResult/Vina_trainResult_2016.csv | awk -F"," '{print $3","$4","$5","$6","$7","$8}' >> VinaResult/$folder/Vina_$traincut

		grep ${i} CyscoreResult/Cyscore_trainResult_2016.csv | awk -F"," '{printf $3","$4","$5","$6","}' >> Cy_Xscore_VinaResult/$folder/Cy_Xscore_Vina_$traincut
		grep ${i} XscoreResult/Xscore_trainResult_2016.csv | awk -F"," '{printf $3","$4","$5","$6","$7","$8","}' >> Cy_Xscore_VinaResult/$folder/Cy_Xscore_Vina_$traincut
		grep ${i} VinaResult/Vina_trainResult_2016.csv | awk -F"," '{print $3","$4","$5","$6","$7","$8}' >> Cy_Xscore_VinaResult/$folder/Cy_Xscore_Vina_$traincut

	done

done

#================test.txt================#

awk -F"," '{print $2","$3","$4","$5","$6}' CyscoreResult/Cyscore_testResult_2016.csv >> CyscoreResult/$folder/Cyscore_test.txt
awk -F"," '{print $2","$3","$4","$5","$6","$7","$8}' XscoreResult/Xscore_testResult_2016.csv >> XscoreResult/$folder/Xscore_test.txt
awk -F"," '{print $2","$3","$4","$5","$6","$7","$8}' VinaResult/Vina_testResult_2016.csv >> VinaResult/$folder/Vina_test.txt

printf "Y,Hydrophobic,Vdw,HBond,Ent,VDW,HB,HP,HM,HS,RT,gauss1,gauss2,repulsion,hydrophobic,Hydrogen,Nrot%s\n" >> Cy_Xscore_VinaResult/$folder/Cy_Xscore_Vina_test.txt
for i in `awk -F"," '{print $1}' /home/jessiesze/protein_Similarity/v2016/core-iy.csv`
do
	grep ${i} CyscoreResult/Cyscore_testResult_2016.csv | awk -F"," '{printf $2","$3","$4","$5","$6","}' >> Cy_Xscore_VinaResult/$folder/Cy_Xscore_Vina_test.txt
	grep ${i} XscoreResult/Xscore_testResult_2016.csv | awk -F"," '{printf $3","$4","$5","$6","$7","$8","}' >> Cy_Xscore_VinaResult/$folder/Cy_Xscore_Vina_test.txt
	grep ${i} VinaResult/Vina_testResult_2016.csv | awk -F"," '{print $3","$4","$5","$6","$7","$8}' >> Cy_Xscore_VinaResult/$folder/Cy_Xscore_Vina_test.txt
done

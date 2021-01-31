#!/bin/bash
# Usage: sh extractFeatures.sh
path=`pwd`
train="/home/jessiesze/protein_Similarity/v2016/train.csv"  # use v2016/train.csv
test="/home/jessiesze/protein_Similarity/v2016/core-iy.csv"  # use v2016/core-iy.csv

printf "Name,Y,Hydrophobic,Vdw,HBond,Ent%s\n" >> CyscoreResult/Cyscore_trainResult_2016.csv
printf "Name,Y,VDW,HB,HP,HM,HS,RT%s\n" >> XscoreResult/Xscore_trainResult_2016.csv
printf "Name,Y,gauss1,gauss2,repulsion,hydrophobic,Hydrogen,Nrot%s\n" >> VinaResult/Vina_trainResult_2016.csv

for trainFile in `awk -F"," '{print $1}' ${train}`
do
	printf "$trainFile," >> CyscoreResult/Cyscore_trainResult_2016.csv
	printf "$trainFile," >> XscoreResult/Xscore_trainResult_2016.csv
	printf "$trainFile," >> VinaResult/Vina_trainResult_2016.csv
	y=`grep ${trainFile} ${train} | awk -F"," '{print $2}'`
	printf "$y," >> CyscoreResult/Cyscore_trainResult_2016.csv
	printf "$y," >> XscoreResult/Xscore_trainResult_2016.csv
	printf "$y," >> VinaResult/Vina_trainResult_2016.csv

	/home/jessiesze/CyscorePackage/bin/Cyscore /home/jessiesze/protein_Similarity/v2016/$trainFile/$trainFile"_protein.pdb" /home/jessiesze/protein_Similarity/v2016/$trainFile/$trainFile"_ligand.mol2" | tail -4 | head -1 | awk '{print $2","$4","$6","$8}' >> CyscoreResult/Cyscore_trainResult_2016.csv

	cd /home/jessiesze/xscore_v1.3/bin
	./xscore_64bit -score /home/jessiesze/protein_Similarity/v2016/$trainFile/$trainFile"_protein.pdb" /home/jessiesze/protein_Similarity/v2016/$trainFile/$trainFile"_ligand.mol2" >> Cy_result2016.log
	cd $path
	grep "Total" /home/jessiesze/xscore_v1.3/bin/xscore.log | awk '{print $2","$3","$4","$5","$6","$7}' >> XscoreResult/Xscore_trainResult_2016.csv

# Finally, RF-Score replace autodock to calculate vina Features
##	/home/jessiesze/autodock_vina_1_1_2_linux_x86/bin/vina --receptor /home/jessiesze/protein_Similarity/v2016/$trainFile/$trainFile"_protein.pdbqt" --ligand /home/jessiesze/protein_Similarity/v2016/$trainFile/$trainFile"_ligand.pdbqt" --score_only | tail -5 | awk -F": " '{print $2}' | cat | tr '\n' ',' >> VinaResult/Vina_trainResult_2016.csv
##	Nrot=`/home/jessiesze/RF-Score/bin/rf-extract /home/jessiesze/protein_Similarity/v2016/$trainFile/$trainFile"_protein.pdbqt" /home/jessiesze/protein_Similarity/v2016/$trainFile/$trainFile"_ligand.pdbqt" 2 | tail -1 |awk -F"," '{print $(NF-1)+$NF*0.5}'`
##	printf "$Nrot%s\n" >> VinaResult/Vina_trainResult_2016.csv
	/home/jessiesze/RF-Score/bin/rf-extract /home/jessiesze/protein_Similarity/v2016/$trainFile/$trainFile"_protein.pdbqt" /home/jessiesze/protein_Similarity/v2016/$trainFile/$trainFile"_ligand.pdbqt" 2 | tail -1 | awk -F"," '{print $1","$2","$3","$4","$5","$(NF-1)+$NF*0.5}' >> VinaResult/Vina_trainResult_2016.csv

done

printf "Name,Y,Hydrophobic,Vdw,HBond,Ent%s\n" >> CyscoreResult/Cyscore_testResult_2016.csv
printf "Name,Y,VDW,HB,HP,HM,HS,RT%s\n" >> XscoreResult/Xscore_testResult_2016.csv
printf "Name,Y,gauss1,gauss2,repulsion,hydrophobic,Hydrogen,Nrot%s\n" >> VinaResult/Vina_testResult_2016.csv

for testFile in `awk -F"," '{print $1}' ${test}`
do
	printf "$testFile," >> CyscoreResult/Cyscore_testResult_2016.csv
	printf "$testFile," >> XscoreResult/Xscore_testResult_2016.csv
	printf "$testFile," >> VinaResult/Vina_testResult_2016.csv
	y=`grep ${testFile} ${test} | awk -F"," '{print $2}'`
	printf "$y," >> CyscoreResult/Cyscore_testResult_2016.csv
	printf "$y," >> XscoreResult/Xscore_testResult_2016.csv
	printf "$y," >> VinaResult/Vina_testResult_2016.csv

	/home/jessiesze/CyscorePackage/bin/Cyscore /home/jessiesze/protein_Similarity/v2016/$testFile/$testFile"_protein.pdb" /home/jessiesze/protein_Similarity/v2016/$testFile/$testFile"_ligand.mol2" | tail -4 | head -1 | awk '{print $2","$4","$6","$8}' >> CyscoreResult/Cyscore_testResult_2016.csv

	cd /home/jessiesze/xscore_v1.3/bin
	./xscore_64bit -score /home/jessiesze/protein_Similarity/v2016/$testFile/$testFile"_protein.pdb" /home/jessiesze/protein_Similarity/v2016/$testFile/$testFile"_ligand.mol2" >> Cy_result2016.log
	cd $path
	grep "Total" /home/jessiesze/xscore_v1.3/bin/xscore.log | awk '{print $2","$3","$4","$5","$6","$7}' >> XscoreResult/Xscore_testResult_2016.csv

# Finally, RF-Score replace autodock to calculate vina Features
##	/home/jessiesze/autodock_vina_1_1_2_linux_x86/bin/vina --receptor /home/jessiesze/protein_Similarity/v2016/$testFile/$testFile"_protein.pdbqt" --ligand /home/jessiesze/protein_Similarity/v2016/$testFile/$testFile"_ligand.pdbqt" --score_only | tail -5 | awk -F": " '{print $2}' | cat | tr '\n' ',' >> VinaResult/Vina_testResult_2016.csv
##	Nrot=`/home/jessiesze/RF-Score/bin/rf-extract /home/jessiesze/protein_Similarity/v2016/$testFile/$testFile"_protein.pdbqt" /home/jessiesze/protein_Similarity/v2016/$testFile/$testFile"_ligand.pdbqt" 2 | tail -1 |awk -F"," '{print $(NF-1)+$NF*0.5}'`
##	printf "$Nrot%s\n" >> VinaResult/Vina_testResult_2016.csv
	/home/jessiesze/RF-Score/bin/rf-extract /home/jessiesze/protein_Similarity/v2016/$testFile/$testFile"_protein.pdbqt" /home/jessiesze/protein_Similarity/v2016/$testFile/$testFile"_ligand.pdbqt" 2 | tail -1 | awk -F"," '{print $1","$2","$3","$4","$5","$(NF-1)+$NF*0.5}' >> VinaResult/Vina_testResult_2016.csv

done

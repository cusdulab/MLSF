# Usage: sh pipeline.sh

sh extractFeatures.sh &

#========================= protein ==========================#

perl calcSimilarity.pl protein Similarity.csv 0.3
sh generateSubsetFeatures.sh protein

for j in `cat RF_input`
do
        path=`echo $j | cut -d"," -f 1`;
        method=`echo $j | cut -d"," -f 2`;
        output=`echo $j | cut -d"," -f 3`;
        Rscript rf.R protein $path $method $output
done

for j in `cat lm_input`
do
        path=`echo $j | cut -d"," -f 1`;
        method=`echo $j | cut -d"," -f 2`;
        output=`echo $j | cut -d"," -f 3`;
        Rscript lm.R protein $path $method $output
done

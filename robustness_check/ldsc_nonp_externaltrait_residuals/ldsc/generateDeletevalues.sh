#!/bin/bash
input1=$1
input2=$2
input3=$3
input4=$4
output1=$5
output2=$6
globaloutput=$7
ldscoredir="/mnt/d/PhD Queen Mary/PhD Project 1 - p_non-p/Analysis Pipeline/5 - LDSC/ldsc/"
#pythonpath="/mnt/lustre/groups/ukbiobank/Edinburgh_Data/Software/anaconda2/bin/python"

ldsc/ldsc.py --n-blocks 200 --print-delete-vals --rg "${input1}","${input2}" --ref-ld-chr "$ldscoredir"/eur_w_ld_chr/ --w-ld-chr "$ldscoredir"/eur_w_ld_chr/ --out ${output1}
ldsc/ldsc.py --n-blocks 200 --print-delete-vals --rg "${input3}","${input4}" --ref-ld-chr "$ldscoredir"/eur_w_ld_chr/ --w-ld-chr "$ldscoredir"/eur_w_ld_chr/ --out ${output2}

#mv *.log "$outpath"/Logs/ 
#mv *.delete "$outpath"/DeleteVals/ 

#bash ./compare2GeneticCorrelations.sh outputADHD_environmentstress.log outputADHDnonp_environmentstress.log environmentalstress.sumstats.gz ADHD.sumstats.gz environmentalstress.sumstats.gz ADHDnonp.sumstats.gz Output



#python3 "$ldscoredir"/ldsc/ldsc.py  --n-blocks 200 --print-delete-vals --rg ${input1},${input2} --ref-ld-chr "$ldscoredir"/eur_w_ld_chr/ --w-ld-chr "$ldscoredir"/eur_w_ld_chr/ --out ${output1}
#python3 "$ldscoredir"/ldsc/ldsc.py  --n-blocks 200 --print-delete-vals --rg ${input3},${input4} --ref-ld-chr "$ldscoredir"/eur_w_ld_chr/ --w-ld-chr $ldscoredir/eur_w_ld_chr/ --out ${output2}

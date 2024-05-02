######## Script 2: run rg comparison between traits for a list of traits

# change to directory with file paths
cd ~/credentials/anxiety_gwas

# call working directory file path (set file path for working directory [from paths.config.sh])
workdir=$(sed '2q;d' paths.config.sh)

#### Create script that specifies traits to run rg comparision with

# remove previous script if exists
rm ${workdir}scripts/run_compare_rg_with_list.sh

# create new .sh file
cat <<'EOT'>> ${workdir}scripts/run_compare_rg_with_list.sh
#!/bin/bash -l
#SBATCH --partition cpu
#SBATCH --time=0-48:00:00
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=19G
#SBATCH --job-name=run_compare_rg_with_list
#SBATCH --output=run_compare_rg_with_list%j.out

cd ~/credentials/anxiety_gwas
workdir=$(sed '2q;d' paths.config.sh)
logpath=${workdir}external_rg/results_nomhc/

# Specify traits to compare genetic correlations with
# name1, 2 and 3 specified in command line when job submitted (at end of script) where:
# name1: list of traits to compare rg with (across first and second trait)
# name2: first trait for comparison
# name3: second trait for comparison

name2=$2
name3=$3

# read list of traits file to compare rg with  (name1)
varid=$1
pathvarid="${workdir}scripts/${varid}"
countvarid=$(wc -l ${pathvarid}|awk '{printf $1}')

for i in `seq 1 ${countvarid}`
do name1=$(gawk -v myvar=$i 'NR==myvar{printf $1}' ${pathvarid})

# submit script comparing two genetic correlations from rg log file (across list of traits)
sh ${workdir}scripts/compare2GeneticCorrelations.sh \
$logpath/${name2}/${name1}_${name2}.log \
$logpath/${name3}/${name1}_${name3}.log \
${name1} \
${name2} \
${name3}

done

EOT

####STEP 4: SUBMIT SCRIPT 2 (WHICH WILL ALSO SUBMIT SCRIPT 1 USING SH):
cd ~/credentials_dir
workdir=$(sed '2q;d' paths.config.sh)
sbatch ${workdir}scripts/run_compare_rg_with_list.sh sumstats_list.txt trait1 trait2 ## script 1, $1 = list of traits to compare rg with, $2 = first trait for comparison e.g. GAD, $3 = second trait for comparison e.g. Fear

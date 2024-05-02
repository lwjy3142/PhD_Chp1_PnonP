####### Script 1: compare two genetic correlation results from LDSC log and delete values files (calls in a python script doJackyCompare2GeneticCorrelations.py)

#activate ldsc environment with python
conda activate ldsc_env

#change to directory with file paths
cd ~/credentials/anxiety_gwas

#call working directory file path
workdir=$(sed '2q;d' paths.config.sh)

# Note: this script reads in LDSC rg results (rg log file and delete values). An example of the file format of the delete values files (between DEP and GAD): DEP_GADGAD_noMHC.sumstats.gz_DEP_noMHC.sumstats.gz - i.e. the two traits the rg is between, and the sumstats file for both
## Create compare2GeneticCorrelations.sh
rm ${workdir}scripts/compare2GeneticCorrelations.sh
cat <<'EOT'>> ${workdir}scripts/compare2GeneticCorrelations.sh
#!/bin/bash -l
#SBATCH --partition shared,brc
#SBATCH --time=0-06:00:00
#SBATCH -c 8
#SBATCH --mem-per-cpu=9G
#SBATCH -o wrapper_script_compare2GeneticCorrelations."%j".out

cd ~/credentials/anxiety_gwas
workdir=$(sed '2q;d' paths.config.sh)

# file path to python script to run Jackknife rg comparison
gwassumstatsprj=$(sed '9q;d' paths.config.sh)

# file path to output directory
outputpath=${workdir}/external_rg/results_nomhc/compare_rg

# file path for rg log results
logpath=${workdir}external_rg/results_nomhc

# file path to delete values generated from LDSC
deletevalspath=${logpath}/deletevalues

# GWAS summary statistics file format
file_type=noMHC.sumstats.gz


# log files for comparison (log1 and log2), and names of traits for comparison (phen1, phen 2, phen 3) - specified in run_compare_rg_with_list.sh
log1=$1
log2=$2
phen1=$3
phen2=$4
phen3=$5

# specify where global rg results are in .log file for rg1 result and rg2 result
globalrg1=$(grep "Genetic Correlation:" ${log1}|awk '{printf $3}')
globalrg2=$(grep "Genetic Correlation:" ${log2}|awk '{printf $3}')

# print info
echo "correlation1: $globalrg1"
echo "correlation2: $globalrg2"
echo "output written to:${outputpath}/${phen1}_${phen2}_${phen1}_${phen3}.log"

# call python script to run rg comparison (difference in rg with phen1 [from list of traits] with phen2 versus phen3)
python ${gwassumstatsprj}scripts/doJackyCompare2GeneticCorrelations.py ${deletevalspath}/${phen1}_${phen2}${phen2}_${file_type}_${phen1}_${file_type}.gencov.delete ${deletevalspath}/${phen1}_${phen3}${phen3}_${file_type}_${phen1}_${file_type}.gencov.delete ${deletevalspath}/${phen1}_${phen2}${phen2}_${file_type}_${phen1}_${file_type}.hsq1.delete ${deletevalspath}/${phen1}_${phen2}${phen2}_${file_type}_${phen1}_${file_type}.hsq2.delete ${deletevalspath}/${phen1}_${phen3}${phen3}_${file_type}_${phen1}_${file_type}.hsq1.delete ${deletevalspath}/${phen1}_${phen3}${phen3}_${file_type}_${phen1}_${file_type}.hsq2.delete $globalrg1 $globalrg2 ${outputpath}/${phen1}_${phen2}_${phen1}_${phen3}.log
echo ""

EOT

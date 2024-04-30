#!/bin/bash -l
#SBATCH --output=/scratch/prj/teds/Sumstate_PRS_Codelab/robustness_check/ANX_genomicSEM1_%A_%a.out
#SBATCH --error=/scratch/prj/teds/Sumstate_PRS_Codelab/robustness_check/ANX_genomicSEM1_%A_%a.err
#SBATCH --time=2-00:00:00
#SBATCH --cpus-per-task=32
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --array=2-39
#SBATCH --mem-per-cpu=8GB
#SBATCH --partition=cpu
#SBATCH --job-name=ANX
#SBATCH --mail-type=END
#SBATCH --mail-user=wangjingyi.liao@kcl.ac.uk

export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1

#the array argument should reflect the number of row in the row_chunk.csv


WORKdir='/scratch/prj/teds/Sumstate_PRS_Codelab/robustness_check/' #set working directory

cd $WORKdir

start_row=$(awk -F',' "NR==$SLURM_ARRAY_TASK_ID {print \$1}" ${WORKdir}/row_chunk.csv) #given the arrary job ID, it takes first column of excel input file
end_row=$(awk -F',' "NR==$SLURM_ARRAY_TASK_ID {print \$2}" ${WORKdir}/row_chunk.csv)  #given the arrary job ID, it takes second column of excel input file 


#load necessary modules 
module load r/4.1.1-gcc-10.3.0-withx-rmath-standalone-python3+-chk-version

#Execute program located in current folder


Rscript --vanilla /scratch/prj/teds/Sumstate_PRS_Codelab/robustness_check/ANX_genomicSEM.R -s $start_row -e $end_row

#!/bin/bash -l
#SBATCH --output=/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/array_ldsc_%A_%a.out
#SBATCH --error=/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/array_ldsc_%A_%a.err
#SBATCH --time=1-00:00:00
#SBATCH --cpus-per-task=32
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=8GB
#SBATCH --partition=cpu
#SBATCH --job-name=LDSC_external_traits
#SBATCH --mail-type=END
#SBATCH --mail-user=wangjingyi.liao@kcl.ac.uk
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1

# Load modules
module load r/4.1.1-gcc-9.4.0-withx-rmath-standalone-python-3.8.12

#argument 1: original - the name of the trait, e.g. ADHD
#argument 2: nonP - the name of the trait nonP, e.g. ADHDnonP
#argument 3: pop_prev - the population prevalence of the trait, e.g. 0.05
#argument 4: sample_prev - sample prevelance of the original, NA if neff was used. 
#sample.prev <- c(.5, .5, .5, .5, .5, .5, NA, .5, .5, .5, .5)
#population.prev <- c(.01, .02, 0.05, 0.21, 0.2, 0.3, NA, 0.012, 0.025, 0.009, 0.008)
#trait.names <- c("SCZ", "BIP","ADHD","MDD", "ANX", "PTSD", "ALCH", "ASD","OCD","AN","TS")
{
Rscript --no-save --slave /scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/LDSC_universal.R SCZ SCZnonp 0.01 0.5
}&{
Rscript --no-save --slave /scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/LDSC_universal.R BIP BIPnonp 0.02 0.5
}&{
Rscript --no-save --slave /scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/LDSC_universal.R ADHD ADHDnonp  0.05 0.5
}&{
Rscript --no-save --slave /scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/LDSC_universal.R MDD MDDnonp 0.21 0.5
}&{
Rscript --no-save --slave /scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/LDSC_universal.R ANX ANXnonp 0.2 0.5
}&{
Rscript --no-save --slave /scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/LDSC_universal.R PTSD PTSDnonp 0.3 0.5
}&{
Rscript --no-save --slave /scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/LDSC_universal.R ALCH ALCHnonp NA NA
}&{
Rscript --no-save --slave /scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/LDSC_universal.R ASD ASDnonp 0.012 0.5
}&{
Rscript --no-save --slave /scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/LDSC_universal.R OCD OCDnonp 0.025 0.5
}&{
Rscript --no-save --slave /scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/LDSC_universal.R AN ANnonp 0.009 0.5
}&{
Rscript --no-save --slave /scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/LDSC_universal.R TS TSnonp 0.008 0.5
}
wait
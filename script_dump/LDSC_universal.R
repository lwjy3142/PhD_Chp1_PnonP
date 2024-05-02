##################################################
## Project: PandNonP Project 2023
## Script purpose: R script to prepare the sum stats for GenomicSEM
## Follows https://github.com/MichelNivard/GenomicSEM/wiki/5.-User-Specified-Models-with-SNP-Effects
## Author: Engin Keser & Wangjingyi Liao
##################################################

# install.packages("devtools")
# library(devtools)
# install_github("MichelNivard/GenomicSEM")



#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
original= as.character(args[1]) #e.g. ADHD
nonP = as.character(args[2]) #e.g. ADHDnonp
pop_prev = as.numeric(args[3]) #e.g. population prevelance of ADHD original, NA in the Non-ps
sample_prev =  as.numeric(args[4]) # sample prevelance of the original, NA if neff was used. 

#ext_trait = as.character(args[3]) 
#
#pop_prev_trait =  as.numeric(args[6])

munged_original <- paste0('/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/genomicSEM/', original, '.sumstats.gz')
munged_nonP <- paste0('/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/withintrait_LDSC/', nonP, '.sumstats.gz')
#munged_exttrait <- paste0(ext_trait, '.sumstats.gz')

setwd('/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/')
file_log <- paste0(original, "_LDSC.log") 

file.create(file_log) #create log file

cat("the trait folder is ", getwd(), "\n",
       "the name of the original sumstates ", c(original,munged_original), "\n", 
       "the name of the non-p sumstates ", c(nonP,munged_nonP), "\n", 
       "The original trait population prevelence ", c(pop_prev), "\n", 
    "The original trait sample prevelence ", c(sample_prev), "\n", file=file_log,append=TRUE)

require(GenomicSEM)

cat("the working directory is ", getwd(), "\n"," ","\n", sep="",file=file_log,append=TRUE)


munged_external_folder <- 'munged_external_cont/'
munged_external <- list.files(munged_external_folder)
file_names <- gsub("\\.sumstats\\.gz$", "", munged_external)
munged_external <- paste0('munged_external_cont/', munged_external)

cat("the munged external trait folder is ", munged_external_folder, "\n"," ","\n", sep="",file=file_log,append=TRUE)
cat("the munged external trait names are ", file_names, "\n"," ","\n", sep="\n",file=file_log,append=TRUE)

na_list <- rep(NA, length(munged_external))

#####################
# run multivariate ldsc
#####################

traits <- c(munged_original,munged_nonP, munged_external)
sample.prev <- c(sample_prev,NA,na_list)
population.prev <- c(pop_prev,NA, na_list)
ld<-"/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/raw_data/eur_w_ld_chr/"
wld<-"/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/raw_data/eur_w_ld_chr/"
trait.names <- c(original, nonP, file_names)
LDSCoutput <- ldsc(traits, sample.prev, population.prev, ld, wld, trait.names)
save(LDSCoutput, file=paste0("LDSCoutput_",original,'_continuous_external',".RData"))

cat('LDSC is done!', "\n"," ","\n", sep="",file=file_log,append=TRUE)

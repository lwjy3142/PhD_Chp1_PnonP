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
original= as.character(args[1])

setwd('/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/external_traits_ldsc/')

require(GenomicSEM)

munged_external_folder <- 'munged_external_cont/'
munged_external <- list.files(munged_external_folder)
file_names <- gsub("\\.sumstats\\.gz$", "", munged_external)
munged_external <- paste0('munged_external_cont/', munged_external)


na_list <- rep(NA, length(munged_external))

#####################
# run multivariate ldsc
#####################

traits <- c('/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/GbS/Psum.sumstats.gz', munged_external)
sample.prev <- c(NA,na_list)
population.prev <- c(NA,na_list)
ld<-"/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/raw_data/eur_w_ld_chr/"
wld<-"/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/raw_data/eur_w_ld_chr/"
trait.names <- c(original, file_names)
LDSCoutput <- ldsc(traits, sample.prev, population.prev, ld, wld, trait.names)
save(LDSCoutput, file=paste0("LDSCoutput_",original,'_continuous_external',".RData"))


library(GenomicSEM)
library(optparse)

#take the start and end row for one chunk of analysis

option_list = list(
  make_option(c("-s", "--start"), type="integer", default=NULL, 
              help="The start line. \n", metavar="number"),
  make_option(c("-e", "--end"), type="integer", 
              default=NULL, 
              help="The end line. \n", metavar="number")
); 

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

print(opt)

#save the row number to be called in the subset function 
start_row = opt$start
end_row = opt$end


#load the LDSC and perpared SUMSTATS file for GWAS
load('./LDSC_11traits.RData')

load('./P_sumstats_11traits.RData')

#subset the sumstats
test <- sumstats[start_row:start_row,]

#run the gwas of the subset
#result <- commonfactorGWAS(covstruc = LDSCoutput, SNPs = test, cores = 100)

#each of the traits should be submiited as a sperate job. 

#MDD
model = "  

P =~ NA*SCZ + BIP + ADHD + MDD + ANX + PTSD + ALCH + ASD +OCD + AN + TS
P~~1*P  

P + MDD ~ SNP

"

result <- userGWAS(covstruc = LDSCoutput, SNPs = test, model = model, sub=c("MDD~SNP"),cores = 100)

#create a file name including the range of the chunk
filename <- paste0('./robustness_check/MDDnonp_gwas_', start_row,'_', end_row, '.rds')


#save the result as rds file
save(result, file=filename)

#ANX
model = "  

P =~ NA*SCZ + BIP + ADHD + MDD + ANX + PTSD + ALCH + ASD +OCD + AN + TS
P~~1*P  

P + ANX ~ SNP

"

result <- userGWAS(covstruc = LDSCoutput, SNPs = test, model = model, sub=c("ANX~SNP"),cores = 100)

#create a file name including the range of the chunk
filename <- paste0('./robustness_check/ANXnonp_gwas_', start_row,'_', end_row, '.rds')


#save the result as rds file
save(result, file=filename)

#SCZ
model = "  

P =~ NA*SCZ + BIP + ADHD + MDD + ANX + PTSD + ALCH + ASD +OCD + AN + TS
P~~1*P  

P + SCZ ~ SNP

"

result <- userGWAS(covstruc = LDSCoutput, SNPs = test, model = model, sub=c("SCZ~SNP"),cores = 100)

#create a file name including the range of the chunk
filename <- paste0('./robustness_check/SCZnonp_gwas_', start_row,'_', end_row, '.rds')


#save the result as rds file
save(result, file=filename)

#BIP
model = "  

P =~ NA*SCZ + BIP + ADHD + MDD + ANX + PTSD + ALCH + ASD +OCD + AN + TS
P~~1*P  

P + BIP ~ SNP

"

result <- userGWAS(covstruc = LDSCoutput, SNPs = test, model = model, sub=c("BIP~SNP"),cores = 100)

#create a file name including the range of the chunk
filename <- paste0('./robustness_check/BIPnonp_gwas_', start_row,'_', end_row, '.rds')


#save the result as rds file
save(result, file=filename)

#ADHD
model = "  

P =~ NA*SCZ + BIP + ADHD + MDD + ANX + PTSD + ALCH + ASD +OCD + AN + TS
P~~1*P  

P + ADHD ~ SNP

"

result <- userGWAS(covstruc = LDSCoutput, SNPs = test, model = model, sub=c("ADHD~SNP"),cores = 100)
#create a file name including the range of the chunk
filename <- paste0('./robustness_check/ADHDnonp_gwas_', start_row,'_', end_row, '.rds')


#save the result as rds file
save(result, file=filename)

#PTSD
model = "  

P =~ NA*SCZ + BIP + ADHD + MDD + ANX + PTSD + ALCH + ASD +OCD + AN + TS
P~~1*P  

P + PTSD ~ SNP

"

result <- userGWAS(covstruc = LDSCoutput, SNPs = test, model = model, sub=c("PTSD~SNP"),cores = 100)

#create a file name including the range of the chunk
filename <- paste0('./robustness_check/PTSDnonp_gwas_', start_row,'_', end_row, '.rds')


#save the result as rds file
save(result, file=filename)

#ALCH
model = "  

P =~ NA*SCZ + BIP + ADHD + MDD + ANX + PTSD + ALCH + ASD +OCD + AN + TS
P~~1*P  

P + ALCH ~ SNP

"

result <- userGWAS(covstruc = LDSCoutput, SNPs = test, model = model, sub=c("ALCH~SNP"),cores = 100)

#create a file name including the range of the chunk
filename <- paste0('./robustness_check/ALCHnonp_gwas_', start_row,'_', end_row, '.rds')


#save the result as rds file
save(result, file=filename)

#ASD
model = "  

P =~ NA*SCZ + BIP + ADHD + MDD + ANX + PTSD + ALCH + ASD +OCD + AN + TS
P~~1*P  

P + ASD ~ SNP

"

result <- userGWAS(covstruc = LDSCoutput, SNPs = test, model = model, sub=c("ASD~SNP"),cores = 100)

#create a file name including the range of the chunk
filename <- paste0('./robustness_check/ASDnonp_gwas_', start_row,'_', end_row, '.rds')


#save the result as rds file
save(result, file=filename)

#OCD
model = "  

P =~ NA*SCZ + BIP + ADHD + MDD + ANX + PTSD + ALCH + ASD +OCD + AN + TS
P~~1*P  

P + OCD ~ SNP

"

result <- userGWAS(covstruc = LDSCoutput, SNPs = test, model = model, sub=c("OCD~SNP"),cores = 100)

#create a file name including the range of the chunk
filename <- paste0('./robustness_check/OCDnonp_gwas_', start_row,'_', end_row, '.rds')


#save the result as rds file
save(result, file=filename)

#AN
model = "  

P =~ NA*SCZ + BIP + ADHD + MDD + ANX + PTSD + ALCH + ASD +OCD + AN + TS
P~~1*P  

P + AN ~ SNP

"

result <- userGWAS(covstruc = LDSCoutput, SNPs = test, model = model, sub=c("AN~SNP"),cores = 100)

#create a file name including the range of the chunk
filename <- paste0('./robustness_check/ANnonp_gwas_', start_row,'_', end_row, '.rds')


#save the result as rds file
save(result, file=filename)

#TS
model = "  

P =~ NA*SCZ + BIP + ADHD + MDD + ANX + PTSD + ALCH + ASD +OCD + AN + TS
P~~1*P  

P + TS ~ SNP

"

result <- userGWAS(covstruc = LDSCoutput, SNPs = test, model = model, sub=c("TS~SNP"),cores = 100)

#create a file name including the range of the chunk
filename <- paste0('./robustness_check/TSnonp_gwas_', start_row,'_', end_row, '.rds')


#save the result as rds file
save(result, file=filename)


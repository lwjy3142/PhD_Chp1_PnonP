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


#load the LDSC and sumstats from before
load('/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/genomicSEM/LDSC_11traits.RData')

load('/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/genomicSEM/P_sumstats_11traits.RData')

#subset the sumstats
test <- sumstats[start_row:end_row,]

#ASD
model = "  

P =~ NA*SCZ + BIP + ADHD + MDD + ANX + PTSD + ALCH + ASD +OCD + AN + TS
P~~1*P  

P + ASD ~ SNP

"

result <- userGWAS(covstruc = LDSCoutput, SNPs = test, model = model, sub=c("ASD~SNP"),cores = 100)


#create a file name including the range of the chunk
filename <- paste0('/scratch/prj/teds/Sumstate_PRS_Codelab/robustness_check/ASDnonp_gwas_', start_row,'_', end_row, '.rds')


#save the result as rds file
save(result, file=filename)
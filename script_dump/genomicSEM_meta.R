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

#save the row number to be called in the subset function 
start_row = opt$start
end_row = opt$end


#load the LDSC and sumstats from before
load('/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/')

load('/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/')

test <- Sumstats[start_row:end_row,]

###=======MULTIVARIATE GWAS========###

#specify the model
model <- 'F1 =~ 1*Anxiety_Otowa + 1*Anxiety_Purves
F1 ~ SNP
Anxiety_Otowa ~~ 0* Anxiety_Otowa
Anxiety_Purves ~~ 0* Anxiety_Purves'


#run the multivariate GWAS using parallel processing
result<-userGWAS(covstruc = LDSCoutput, SNPs = test, model = model, sub= ("F1~SNP"), cores=100)

#create a file name including the range of the chunk
filename <- paste0('/scratch/prj/teds/Sumstate_PRS_Codelab/disease_specificity/meta_analysis/genomicSEM_anxiety/Anxiety_metaanalysis_', start_row,'_', end_row, '.rda')


#save the result as rds file
save(result, file=filename)

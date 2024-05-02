#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
sumstats=as.character(args[1])
wkdir=as.character(args[2])

load(file=sumstats)

num_partitions <- ceiling(nrow(sumstats)/100000)

print(num_partitions)

result_list <- list()
# Create a for loop to partition the data frame into smaller data frames

for(i in 1:num_partitions) {
  start_row <- (i - 1) * 100000 + 1
  end_row <- min(i * 100000, nrow(sumstats))
  p_name <- paste0('p', start_row, '_', end_row)
  nonp_name <- paste0('nonp', start_row, '_', end_row)
  partition_name <- paste0(start_row, ',', end_row, ',', p_name, ',', nonp_name)
  result_list[[i]] <- partition_name
}

combined_results <- do.call("rbind", result_list)

write.csv(combined_results, file = paste0(wkdir, '/row_chunk.csv'), row.names = F, col.names = F, quote = F)
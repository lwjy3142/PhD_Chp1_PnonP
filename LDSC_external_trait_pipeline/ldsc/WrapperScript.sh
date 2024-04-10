# To compare the genetic correlation of A ßà C, B ßà C, run:
# sh ./generateDeletevalues.sh MungedFileForA.sumstats.gz MungedFileForC.sumstats.gz MungedFileForB.sumstats.gz MungedFileForC.sumstats.gz OutputAC OutputBC
# bash ./compare2GeneticCorrelations.sh OutputAC.log OutputBC.log MungedFileForC.sumstats.gz MungedFileForA.sumstats.gz MungedFileForC.sumstats.gz MungedFileForB.sumstats.gz Output


p_sumstats_path="../p_sumstats" #path to the sumstats munged file before controlling for p
nonp_sumstats_path="../non-p_sumstats" #path to the sumstats munged file before controlling for non-p
external_sumstats_path="../munged_external_cont" #path to the external trait sumstats munged file
outpath="../ldsc" #path to the output directory

##generate delete values

rm log_file

#ADHD
num_files=$(ls -1 "$external_sumstats_path"/*.sumstats.gz | wc -l)
echo "Number of files in $external_sumstats_path: $num_files" >> log_file


for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="ADHD_${new_filename}"
    new_outputBC="ADHDnonp_${new_filename}"
    Output="jf_ADHD_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/ADHD.sumstats.gz "$file" "$nonp_sumstats_path"/ADHDnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  ADHD.sumstats.gz $filename ADHDnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#BIP

for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="BIP_${new_filename}"
    new_outputBC="BIPnonp_${new_filename}"
    Output="jf_BIP_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/BIP.sumstats.gz "$file" "$nonp_sumstats_path"/BIPnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  BIP.sumstats.gz $filename BIPnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#MDD
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="MDD_${new_filename}"
    new_outputBC="MDDnonp_${new_filename}"
    Output="jf_MDD_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/MDD.sumstats.gz "$file" "$nonp_sumstats_path"/MDDnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  MDD.sumstats.gz $filename MDDnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#OCD
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="OCD_${new_filename}"
    new_outputBC="OCDnonp_${new_filename}"
    Output="jf_OCD_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/OCD.sumstats.gz "$file" "$nonp_sumstats_path"/OCDnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  OCD.sumstats.gz $filename OCDnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#PTSD
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="PTSD_${new_filename}"
    new_outputBC="PTSDnonp_${new_filename}"
    Output="jf_PTSD_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/PTSD.sumstats.gz "$file" "$nonp_sumstats_path"/PTSDnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  PTSD.sumstats.gz $filename PTSDnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done
#ANX
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="ANX_${new_filename}"
    new_outputBC="ANXnonp_${new_filename}"
    Output="jf_ANX_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/ANX.sumstats.gz "$file" "$nonp_sumstats_path"/ANXnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  ANX.sumstats.gz $filename ANXnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done
#AN
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="AN_${new_filename}"
    new_outputBC="ANnonp_${new_filename}"
    Output="jf_AN_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/AN.sumstats.gz "$file" "$nonp_sumstats_path"/ANnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  AN.sumstats.gz $filename ANnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#SCZ
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="SCZ_${new_filename}"
    new_outputBC="SCZnonp_${new_filename}"
    Output="jf_SCZ_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/SCZ.sumstats.gz "$file" "$nonp_sumstats_path"/SCZnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  SCZ.sumstats.gz $filename SCZnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#ALCH
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="ALCH_${new_filename}"
    new_outputBC="ALCHnonp_${new_filename}"
    Output="jf_ALCH_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/ALCH.sumstats.gz "$file" "$nonp_sumstats_path"/ALCHnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  ALCH.sumstats.gz $filename ALCHnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#TS
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="TS_${new_filename}"
    new_outputBC="TSnonp_${new_filename}"
    Output="jf_TS_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/TS.sumstats.gz "$file" "$nonp_sumstats_path"/TSnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  TS.sumstats.gz $filename TSnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#ASD
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="ASD_${new_filename}"
    new_outputBC="ASDnonp_${new_filename}"
    Output="jf_ASD_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/ASD.sumstats.gz "$file" "$nonp_sumstats_path"/ASDnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  ASD.sumstats.gz $filename ASDnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done


# To compare the genetic correlation of A ßà C, B ßà C, run:
# sh ./generateDeletevalues.sh MungedFileForA.sumstats.gz MungedFileForC.sumstats.gz MungedFileForB.sumstats.gz MungedFileForC.sumstats.gz OutputAC OutputBC
# bash ./compare2GeneticCorrelations.sh OutputAC.log OutputBC.log MungedFileForC.sumstats.gz MungedFileForA.sumstats.gz MungedFileForC.sumstats.gz MungedFileForB.sumstats.gz Output


p_sumstats_path="../p_sumstats"
nonp_sumstats_path="../non-p_sumstats"
external_sumstats_path="../munged_external_binary"
outpath="../ldsc"

##generate delete values

#ADHD
num_files=$(ls -1 "$external_sumstats_path"/*.sumstats.gz | wc -l)
echo "Number of files in $external_sumstats_path: $num_files" >> log_file


for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="ADHD_${new_filename}"
    new_outputBC="ADHDnonp_${new_filename}"
    Output="jf_ADHD_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/ADHD.sumstats.gz "$file" "$nonp_sumstats_path"/ADHDnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  ADHD.sumstats.gz $filename ADHDnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#BIP

for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="BIP_${new_filename}"
    new_outputBC="BIPnonp_${new_filename}"
    Output="jf_BIP_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/BIP.sumstats.gz "$file" "$nonp_sumstats_path"/BIPnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  BIP.sumstats.gz $filename BIPnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#MDD
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="MDD_${new_filename}"
    new_outputBC="MDDnonp_${new_filename}"
    Output="jf_MDD_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/MDD.sumstats.gz "$file" "$nonp_sumstats_path"/MDDnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  MDD.sumstats.gz $filename MDDnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#OCD
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="OCD_${new_filename}"
    new_outputBC="OCDnonp_${new_filename}"
    Output="jf_OCD_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/OCD.sumstats.gz "$file" "$nonp_sumstats_path"/OCDnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  OCD.sumstats.gz $filename OCDnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#PTSD
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="PTSD_${new_filename}"
    new_outputBC="PTSDnonp_${new_filename}"
    Output="jf_PTSD_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/PTSD.sumstats.gz "$file" "$nonp_sumstats_path"/PTSDnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  PTSD.sumstats.gz $filename PTSDnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done
#ANX
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="ANX_${new_filename}"
    new_outputBC="ANXnonp_${new_filename}"
    Output="jf_ANX_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/ANX.sumstats.gz "$file" "$nonp_sumstats_path"/ANXnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  ANX.sumstats.gz $filename ANXnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done
#AN
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="AN_${new_filename}"
    new_outputBC="ANnonp_${new_filename}"
    Output="jf_AN_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/AN.sumstats.gz "$file" "$nonp_sumstats_path"/ANnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  AN.sumstats.gz $filename ANnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#SCZ
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="SCZ_${new_filename}"
    new_outputBC="SCZnonp_${new_filename}"
    Output="jf_SCZ_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/SCZ.sumstats.gz "$file" "$nonp_sumstats_path"/SCZnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  SCZ.sumstats.gz $filename SCZnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#ALCH
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="ALCH_${new_filename}"
    new_outputBC="ALCHnonp_${new_filename}"
    Output="jf_ALCH_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/ALCH.sumstats.gz "$file" "$nonp_sumstats_path"/ALCHnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  ALCH.sumstats.gz $filename ALCHnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#TS
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="TS_${new_filename}"
    new_outputBC="TSnonp_${new_filename}"
    Output="jf_TS_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/TS.sumstats.gz "$file" "$nonp_sumstats_path"/TSnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  TS.sumstats.gz $filename TSnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

#ASD
for file in "$external_sumstats_path"/*.sumstats.gz; do
    filename=$(basename "$file")
    new_filename="${filename%%.*}"
    new_outputAC="ASD_${new_filename}"
    new_outputBC="ASDnonp_${new_filename}"
    Output="jf_ASD_${new_filename}"
    echo "Running generateDeletevalues.sh for file: $filename" >> log_file
    start_time=$(date +%s)
    sh ./generateDeletevalues.sh "$p_sumstats_path"/ASD.sumstats.gz "$file" "$nonp_sumstats_path"/ASDnonp.sumstats.gz "$file" $new_outputAC $new_outputBC
    mv *.log "$outpath"/Logs/ 
    mv *.delete "$outpath"/DeleteVals/ 
    bash ./compare2GeneticCorrelations.sh ./Logs/$new_outputAC.log ./Logs/$new_outputBC.log  ASD.sumstats.gz $filename ASDnonp.sumstats.gz $filename $Output
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    #echo "Finished running generateDeletevalues.sh for file: $filename" >> log_file
    echo "Time taken: $duration seconds" >> log_file
done

# read in the jf_ files and extract the genetic correlations

folder="/mnt/d/PhD Queen Mary/PhD Project 1 - p_non-p/Analysis Pipeline/5 - LDSC/ldsc"
# read in the jf_ files and extract the genetic correlations


echo "Trait ExternalTrait jf_p p_cor p_cor_se nonp_cor nonp_cor_se" >> p_nonp_allexternal_traits_ldsc.txt

for file in "$folder"/jf_*; do
    filename=$(basename "$file")
    trait=$(echo "$filename" | cut -d'_' -f2)
    externaltrait=$(echo "$filename" | cut -d'_' -f3-)
    jf_p=$(grep "200" "$file" | awk '{printf $6}')
    p_cor=$(grep "correlation1" "$file" | awk '{printf $2}')
    p_cor_se=$(grep "correlation1" "$file" | awk '{printf $3}' | tr -d '()')
    nonp_cor=$(grep "correlation2" "$file" | awk '{printf $2}')
    nonp_cor_se=$(grep "correlation2" "$file" | awk '{printf $3}'| tr -d '()')
    echo "$trait $externaltrait $jf_p $p_cor $p_cor_se $nonp_cor $nonp_cor_se" >> p_nonp_allexternal_traits_ldsc.txt
done

rm -f -r jf_results 

mkdir jf_results

mv jf_* jf_results

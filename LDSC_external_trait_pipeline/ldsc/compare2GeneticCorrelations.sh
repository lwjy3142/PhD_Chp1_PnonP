##Run generateDeleteValues.sh first

## Commented original parameters
log1=$1
log2=$2
phen1=$3
phen2=$4
phen3=$5
phen4=$6
output=$7


globalrg1=$(grep "Genetic Correlation:" ${log1}|awk '{printf $3}')
globalrg2=$(grep "Genetic Correlation:" ${log2}|awk '{printf $3}')

globalrg1se=$(grep "Genetic Correlation:" ${log1}|awk '{printf $4}')
globalrg2se=$(grep "Genetic Correlation:" ${log2}|awk '{printf $4}')

logroot1=$(sed -e 's/.*Logs\///g' -e 's/.log//g' <(echo $log1))
logroot2=$(sed -e 's/.*Logs\///g' -e 's/.log//g' <(echo $log2))



./doJackyCompare2GeneticCorrelations.py ./DeleteVals/${logroot1}${phen1}_${phen2}.gencov.delete ./DeleteVals/${logroot2}${phen3}_${phen4}.gencov.delete ./DeleteVals/${logroot1}${phen1}_${phen2}.hsq1.delete ./DeleteVals/${logroot1}${phen1}_${phen2}.hsq2.delete ./DeleteVals/${logroot2}${phen3}_${phen4}.hsq1.delete ./DeleteVals/${logroot2}${phen3}_${phen4}.hsq2.delete $globalrg1 $globalrg2 $output

#echo "Difference estimate:"
#cat ${homeDir}/compare_genetic_correlations/${phen1}_${phen2}_${phen3}_${phen4}
echo "correlation1: $globalrg1 $globalrg1se" >> ${output}
echo "correlation2: $globalrg2 $globalrg2se" >> ${output}
echo "output written to:${output}" >> ${output}

echo ""

touch count_sums.txt
for i in *.count
do
nums=$(awk -F '\t' '{sum+=$2} END {print sum}' $i )
echo -e "$i\t$nums" >> count_sums.txt
done
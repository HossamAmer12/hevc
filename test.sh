qpFactStart=$(bc <<<"scale=0; 0.575 * 1000")
qpFactEnd=$(bc <<<"scale=0; 0.585 * 1000")

qpFactStart=$(echo "scale=4; 0.575*1000" | bc)
qpFactEnd=$(echo "scale=4; 0.585*1000" | bc)

qpFactStart=${qpFactStart%.*}
qpFactEnd=${qpFactEnd%.*}

for ((k=$qpFactStart;k<=$qpFactEnd;k++))
do

#qpFact=$(($k/1000))
qpFact=$(bc <<<"scale=3; $k / 1000")

#echo $k
echo $qpFact
done



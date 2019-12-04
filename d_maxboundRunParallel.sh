
# Write it with spaces! -- No Escape characters and don't add "/" at the end
# for standard sequences
#sequences_dir=$HOME/"7aS7aS_Works/work/workspace/TS"

# Number of Parallel tasks
num_parallel_tasks=4

# for YouTube
sequences_dir="/Volumes/DATA/TS"

# echo "TSssss: "$sequences_dir

# Number of Sequences
noSeq=$1 #Send it as the first var we raya7 demaa3'ak

index=1          # Reset count.
# Index of the given argument by the top shell file
argIndex=0

#debugFrames=6
#debugFrames=12
#debugFrames=13
#debugFrames=14
#debugFrames=15
debugFrames=16
#debugFrames=7
debugFrames=36
#debugFrames=16
debugFrames=100
debugFrames=23


#debugFrames=300
#debugFrames=70

# for bqT
debugFrames=50

#debugFrames=26

#debugFrames=30

debugFrames=21

# Index of the CFG array
qpIndex=1 #Start from 1 because you already started from 1


# For reference: ./d_maxBoundRun.sh (0) $noSeq @ (1) $current_yuv 
# 									@ (2) $current_cfg @ (3) "${Qp[@]}" 
#									@ (4)$noCases @ (5)noQp

# Parse the arguments to get the array of YUVs, Sequence CFGs
for arg in "$@"
do

# Found a seperator --> Found a new arg
if [ "$arg" == "@" ]  ; then  
	let "argIndex+=1"
fi

# Filter the 2nd argument (YUV_Array) sent and populate it in the list
if [ "$argIndex" == 1 ] && [ "$arg" != "@" ]  ; then  
  	current_yuv=$arg

  	#echo $current_yuv
fi

# Filter the 3rd argument (CFG_Array) sent and populate it in the list
if [ "$argIndex" == 2 ] && [ "$arg" != "@" ]  ; then  
  current_cfg=$arg

 # echo $current_cfg
fi

# Filter the 3rd argument (Qp_Array) sent and populate it in the list
if [ "$argIndex" == 3 ] && [ "$arg" != "@" ]  ; then  
  Qp[$qpIndex]=$arg

  # echo ${Qp[$qpIndex]}
  let "qpIndex+=1"
fi

# Get the number of cases #TODO: Instead of taking no of cases, take the curent enc cfg
if [ "$argIndex" == 4 ] && [ "$arg" != "@" ]  ; then  
 	noCases=$arg
  # echo $noCases
fi

# Get the number of Qp values
if [ "$argIndex" == 5 ] && [ "$arg" != "@" ]  ; then  
  noQp=$arg

   # echo $noQp
fi

# Get the GOP structure type
if [ "$argIndex" == 6 ] && [ "$arg" != "@" ]  ; then  
  gop_str_type=$arg
 # echo $gop_str_type
fi

# Get the GOP structure type
if [ "$argIndex" == 7 ] && [ "$arg" != "@" ]  ; then  
  current_enc_cfg=$arg
  # echo "Current Enc CFG Received: " $current_enc_cfg
  # read -e hohoz
fi

done             # $@ sees arguments as separate words. 

#-- not test >> + Gop try type only + bug in Qp fixed $

echo BS Output has this format YUV_FILE_QP_GOP_STR_TYPE
echo TXT Output has this format TXTnum_YUV_FILE_QP_GOP_STR_TYPE


# Try for QpFact
# initial value for L1 = 0.5780
#qpFactStart=$(echo "scale=4; 0.575*1000" | bc)
#qpFactStart=$(echo "scale=4; 0.598*1000" | bc)
qpFactStart=$(echo "scale=4; 1.2*10" | bc)
#qpFactStart=$(echo "scale=4; 0.71*100" | bc)
qpFactStart=${qpFactStart%.*}

#qpFactEnd=$(echo "scale=4; 0.585*1000" | bc)
qpFactEnd=$(echo "scale=4; 1.2*10" | bc)
#qpFactEnd=$(echo "scale=4; 0.9*100" | bc)
#qpFactEnd=$(echo "scale=4; 1.0*10" | bc)
qpFactEnd=${qpFactEnd%.*}

kScale=10


# Use that one for qp offset in the I-frame
qpEnd=0 # offset -13


# Number of commands
noCmds=0

#for ((qpRef = 0; qpRef<=$qpEnd;qpRef++))
#do
for ((k=$qpFactStart;k<=$qpFactEnd;k++))
do


# For every YUV, CFG, Case sequence file -> Run All Qps
for ((i = 1; i<=noQp;i++))
do
	printf "\n"
	echo "Start Qp value" ${Qp[$i]} "Run for" $current_yuv "sequence"
	# Set the BS file output name for 5 Qps
	# BS1=$YUV_FILE"_"${Qp[$i]}"_"$GOP_STR_TYPE
	 current_bs=$current_yuv"_"${Qp[$i]}"_"$gop_str_type

   # Set the BS file output name for 5 Qps
   #TXT1=$YUV_FILE"_"$Qp1"_"$GOP_STR_TYPE
   current_txt=$current_yuv"_"${Qp[$i]}"_"$gop_str_type
   
	# echo "BS"$i $current_bs
	# echo "TXT"$i $current_txt
	# echo "GOP"$i $gop_str_type

   # Run i:
#./TAppEncoder -c cfg/$current_enc_cfg.cfg -c cfg/per-sequence/$current_cfg.cfg  \
#              -i "$sequences_dir"/$current_yuv.yuv -q ${Qp[$i]}  \
#             -b Gen/Seq-265/$current_bs.265 > Gen/Seq-TXT/$current_txt.txt


# Run i with parameter skip = QP
#./TAppEncoder -c cfg/$current_enc_cfg.cfg -c cfg/per-sequence/$current_cfg.cfg  \
#              -sk ${Qp[$i]} -i "$sequences_dir"/$current_yuv.yuv -q ${Qp[$i]}  \
#             -b Gen/Seq-265/$current_bs.265 > Gen/Seq-TXT/$current_txt.txt

# Run i with parameter skip = QP
#./TAppEncoder -c cfg/$current_enc_cfg.cfg -c cfg/per-sequence/$current_cfg.cfg  \
#-i "$sequences_dir"/$current_yuv.yuv -sk ${Qp[$i]} -q ${Qp[$i]}  \
#-b Gen/Seq-265/$current_bs.265 > Gen/Seq-TXT/$current_txt.txt

#./TAppEncoder -c cfg/$current_enc_cfg.cfg -c cfg/per-sequence/$current_cfg.cfg  \
#			  -i "$sequences_dir"/$current_yuv.yuv -q ${Qp[$i]}  \
#			  -b Gen/Seq-265/$current_bs.265 > Gen/Seq-TXT/$current_txt.txt

 # DEBUG 3 frames
#./TAppEncoder -c cfg/$current_enc_cfg.cfg -c cfg/per-sequence/$current_cfg.cfg  \
#			  -i "$sequences_dir"/$current_yuv.yuv -q ${Qp[$i]} -f 3 \
#			  -b Gen/Seq-265/$current_bs.265 > Gen/Seq-TXT/$current_txt.txt

# Use the following block if you want to play with reference and predicted
# Debug 3 frames with qpreference from 20 to 31
#qpEnd=31
qpEnd=20
#for ((qpRef = 20; qpRef<=$qpEnd;qpRef++))
#do
#    ./TAppEncoder -c cfg/$current_enc_cfg.cfg -c cfg/per-sequence/$current_cfg.cfg  \
#        -i "$sequences_dir"/$current_yuv.yuv -q ${Qp[$i]} -f $debugFrames -qpRef $qpRef \
#        -b Gen/Seq-265/$current_bs.265 > Gen/Seq-TXT/$current_txt.txt
#    echo "Done QP Reference " $qpRef
#done

# that one for theoritical gain
#qpEnd=31
#qpEnd=20
#for ((qpRef = 20; qpRef<=$qpEnd;qpRef++))
#do
#    ./TAppEncoder -c cfg/$current_enc_cfg.cfg -c cfg/per-sequence/$current_cfg.cfg  \
#        -i "$sequences_dir"/$current_yuv.yuv -q ${Qp[$i]} -f 8 -qpRef $qpRef \
#        -b Gen/Seq-265/$current_bs.265 > Gen/Seq-TXT/$current_txt.txt
#    echo "Done QP Reference " $qpRef
#done

# Use that one for qp offset in the I-frame
#qpEnd=13 # offset -13
#for ((qpRef = 0; qpRef<=$qpEnd;qpRef++))
#do
# Run the qpOffset
#    ./TAppEncoder -c cfg/$current_enc_cfg.cfg -c cfg/per-sequence/$current_cfg.cfg  \
#        -i "$sequences_dir"/$current_yuv.yuv -q ${Qp[$i]} -f $debugFrames -qpRef $qpRef \
#        -b Gen/Seq-265/$current_bs.265 > Gen/Seq-TXT/$current_txt.txt
#    echo "Done QP_I Offset " $qpRef
#done


#qpFact=$(bc <<<"scale=3; $k / 1000")
qpFact=$(bc <<<"scale=3; $k / $kScale")

#./TAppEncoder -c cfg/$current_enc_cfg.cfg -c cfg/per-sequence/$current_cfg.cfg  \
#-i "$sequences_dir"/$current_yuv.yuv -q ${Qp[$i]} -f $debugFrames -qpFact $qpFact \
#-b Gen/Seq-265/$current_bs.265 > Gen/Seq-TXT/$current_txt.txt

# Run all for QP factor
# ./TAppEncoder -c cfg/$current_enc_cfg.cfg -c cfg/per-sequence/$current_cfg.cfg  \
# -i "$sequences_dir"/$current_yuv.yuv -q ${Qp[$i]} -qpFact $qpFact \
# -b Gen/Seq-265/$current_bs.265 > Gen/Seq-TXT/$current_txt.txt


cmd="./TAppEncoder -c cfg/$current_enc_cfg.cfg -c cfg/per-sequence/$current_cfg.cfg -i "$sequences_dir"/$current_yuv.yuv -q ${Qp[$i]} -qpFact $qpFact -b Gen/Seq-265/$current_bs.265 > Gen/Seq-TXT/$current_txt.txt"
cmd_array+=("$cmd")
let noCmds++
echo $cmd

echo "Done QP Factor " $qpFact

#./TAppEncoder -c cfg/$current_enc_cfg.cfg -c cfg/per-sequence/$current_cfg.cfg  \
#			  -i "$sequences_dir"/$current_yuv.yuv -q ${Qp[$i]} -f 3 -qpFact $qpFact  \
#			  -b Gen/Seq-265/$current_bs.265 > Gen/Seq-TXT/$current_txt.txt

#./TAppEncoder -c cfg/$current_enc_cfg.cfg -c cfg/per-sequence/$current_cfg.cfg  \
#			  -i "$sequences_dir"/$current_yuv.yuv -q ${Qp[$i]} -f 590 \
#			  -b Gen/Seq-265/$current_bs.265 > Gen/Seq-TXT/$current_txt.txt




echo "Done Qp value" ${Qp[$i]} "Run for" $current_yuv "sequence"
echo "@@@@@@@@@@@@@@@@"

done

done # qpFactor loop

# done # qpOffset loop (use qpRef for simplicity)

# Run in Parallel - QP level parallelism
start=0
group_id=0
while [  $start -lt $noCmds ]; do {

  # end cannot exceed the length of the Command array
  end=$(($start + $num_parallel_tasks))
  if [ "$(($end))" -gt "$noCmds" ]; then
     end=$noCmds
  fi

 # Start new fork for the next group
 if [ "$(($start))" == "$num_parallel_tasks" ]; then
    group_id=$(($group_id + 1))
    echo -e '\n\n New Group of id $group_id will start now...\n\n'
 fi

  # Run in parallel
  while [  $start -lt $end ]; do {
    cmd="${cmd_array[start]}"
    echo "Process \"$start\" \"$cmd\" started";
    $cmd & pid=$!
    PID_LIST+=" $pid";
    start=$(($start + 1))
  } done

  trap "kill $PID_LIST" SIGINT
  echo "Parallel processes have started";
  wait $PID_LIST
  echo -e "\nAll processes have completed";
} done


printf "\n"
echo "Done with" $noQp "Runs for" $current_yuv "sequence"
# echo "***********************"
# printf "\n"

# DEBUG BreakPoint
# read -e bla_bla



# Rename the summary files to avoid overwriting
mv summaryTotal.txt "SumTot_"$current_yuv"_"$gop_str_type.txt
mv summary_I.txt "SumI_"$current_yuv"_"$gop_str_type.txt
mv summary_P.txt "SumP_"$current_yuv"_"$gop_str_type.txt
mv summary_B.txt "SumB_"$current_yuv"_"$gop_str_type.txt

# Get the Sequence config filename


######################## Move the files to avoid appending
# Rename the outliers file:
mv outliers.txt $current_txt.txt

# Move it!
mv "$current_txt".txt Gen/Seq-SCD-Outliers/$current_txt.txt


# Rename the outliers file:
mv thresholds.txt $current_txt.txt

# Move it!
mv "$current_txt".txt Gen/Seq-SCD-Thresholds/$current_txt.txt


# Rename the Energy file:
mv energy.txt $current_txt.txt

# Move it!
mv "$current_txt".txt Gen/Seq-SCD-Energy/$current_txt.txt


# Rename the residuals file:
mv Residual.yuv $current_txt.yuv

# Move it!
mv "$current_txt".yuv Gen/Seq-Residuals/$current_txt.yuv


# Index of the given argument by the top shell file
argIndex=0


# Index of the CFG array
qpIndex=1 #Start from 1 because you already started from 1


# Get the current YUV file
current_yuv=$1


# Parse the arguments to get the array of Qps
for arg in "$@"
do

# Found a seperator --> Found a new arg
if [ "$arg" == "@" ]  ; then  
	let "argIndex+=1"
fi

# Filter the 2nd argument (YUV_Array) sent and populate it in the list
if [ "$argIndex" == 1 ] && [ "$arg" != "@" ]  ; then  
  	current_caseId=$arg

  	#echo $current_yuv
fi

# Filter the 3rd argument (Qp_Array) sent and populate it in the list
if [ "$argIndex" == 2 ] && [ "$arg" != "@" ]  ; then  
  Qp[$qpIndex]=$arg

  # echo ${Qp[$qpIndex]}
  let "qpIndex+=1"
fi

# Get the number of Qp values
if [ "$argIndex" == 3 ] && [ "$arg" != "@" ]  ; then  
  noQp=$arg

   # echo $noQp
fi


# Get the POC filename
if [ "$argIndex" == 4 ] && [ "$arg" != "@" ]  ; then  
  inputPOCFileName=$arg

#   echo 'Filename' $inputPOCFileName
   # echo $noQp
fi

# Get the POC filename
if [ "$argIndex" == 5 ] && [ "$arg" != "@" ]  ; then  
  current_cfg=$arg

#   echo 'Filename' $inputPOCFileName
   # echo $noQp
fi


done             # $@ sees arguments as separate words. 

current_keyword=$current_yuv$current_caseId

echo $current_keyword




# Select the number of POCS for a specific sequence and case ID
# noPOCs=$(grep $current_keyword $inputPOCFileName| awk '{print $2}')
j=1
current_parse=Gen/Seq-TXT/$current_yuv"_"${Qp[j]}"_"$current_caseId.txt
result=$(grep -A1 'Total Frames' $current_parse | head -2)
noPOCs=$(echo $result | cut -d' ' -f9)
echo 'Total number of frames: ' $noPOCs

# fetch the frame rate from each sequence cfg
path_to_cfg=cfg/per-sequence/
result=$(grep 'Frame Rate' $path_to_cfg/$current_cfg)
frame_rate=$(echo $result | cut -d' ' -f3)
echo 'Frame Rate: ' $frame_rate


#Output file
#current_out=Gen/Seq-FramesStat/Union"_"$current_yuv.txt
current_out=Gen/Seq-FramesStat/partial_UnionBitsPsnr.txt

# At a given YUV file, GOP, get the bits for all the frames 
# Put them in a file
  for ((j = 1; j<=noQp;j++))
  do
   current_parse=Gen/Seq-TXT/$current_yuv"_"${Qp[j]}"_"$current_caseId.txt
   echo $current_parse

    # Set up the accumulation variables
    sum_bits=0
    sum_psnr=0
    total_iter=0

    #for ((i = 0; i<noPOCs;i++))

    # Mu method starts prediction from 8
    # for ((i = 8; i<noPOCs;i++))
    for ((i = 0; i<100;i++))
    # for ((i = 0; i<8;i++))
    # for ((i = 0; i<51;i++))
    do


    current_poc_helper=$i

      #echo $current_poc_helper

    let "startPocIndex+=1" # Increment by 1 to get the next POC
    let "endPocIndex+=1" # Increment by 2 to get all coulmns


      # Adjust the spaces for the keyword
    if [ "$current_poc_helper" -lt 10 ] ; then  
      current_poc=$(echo "POC    "$current_poc_helper)
    elif [ "$current_poc_helper" -lt 100 ] ; then  
      current_poc=$(echo "POC   "$current_poc_helper)
    elif [ "$current_poc_helper" -lt 1000 ] ; then  
      current_poc=$(echo "POC  "$current_poc_helper)
    else
      current_poc=$(echo "POC "$current_poc_helper)
    fi

    # Select the sliceType, bits, yuv_psnr at this Qp
    # poc=$(grep "$current_poc" $current_parse| awk '{print $2}')
    # #echo $poc


    # sliceType=$(grep "$current_poc"  $current_parse| awk '{print $6}')
    # #echo $sliceType


    # qp=$(grep "$current_poc"  $current_parse| awk '{print $10}')
   # echo $qp


    bits=$(grep "$current_poc"  $current_parse| awk '{print $12}')
    # echo $bits

    #read -e amal
    
    y_pnsr=$(grep "$current_poc"  $current_parse| awk '{print $15}')
    #echo $y_pnsr

    let "sum_bits+=$bits"
    sum_psnr=$(python3 -c "print ($sum_psnr+$y_pnsr)")
    let "total_iter+=1"


    count_str="$i\t\t\t"
    count_str="|$count_str|"|tr '\n' ' '

    # Do not write
    # echo -e $count_str$y_pnsr >> "$current_out"

    #echo -e "$qp\t$i\t\t\t\t$y_pnsr" >> "$current_out"
#     echo -e "$i\t\t\t\t$y_pnsr" >> "$current_out"

    
    done # frame loop
    
    echo $total_iter, $sum_bits, $sum_psnr, $frame_rate
    total_bits=$(python3 -c "print ($sum_bits*$frame_rate/(1000*$total_iter))")
    total_psnr=$(python3 -c "print ($sum_psnr/$total_iter)")

    echo Total_iter $total_iter, Bits $total_bits, PSNR $total_psnr

    echo -e $total_bits $total_psnr >> "$current_out"

done # qp loop

 

# echo -e "==========Case done=============" >> "$current_out"





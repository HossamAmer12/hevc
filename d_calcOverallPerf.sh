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
# current_parse=Gen/Seq-TXT/classDOfflineCorrect/$current_yuv"_"${Qp[j]}"_"$current_caseId.txt
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
#current_out=Gen/Seq-TXT/$current_yuv"_"sum.txt
current_out=Gen/Seq-TXT/YUV-PSNR.txt
echo $current_out

# At a given YUV file, GOP, get the bits for all the frames 
# Put them in a file
  for ((j = 1; j<=noQp;j++))
  do
   current_parse=Gen/Seq-TXT/$current_yuv"_"${Qp[j]}"_"$current_caseId.txt
   # current_parse=Gen/Seq-TXT/classDOfflineCorrect/$current_yuv"_"${Qp[j]}"_"$current_caseId.txt
   # echo $current_parse

    # fetch total stats
    result=$(grep -A1 'Total Frames' $current_parse | head -2)
    # echo $result
    bitrate=$(echo $result | cut -d' ' -f11)

    y_psnr=$(echo $result | cut -d' ' -f12)
    u_psnr=$(echo $result | cut -d' ' -f13)
    v_psns=$(echo $result | cut -d' ' -f14)
    yuv_psnr=$(echo $result | cut -d' ' -f15)

    
    
    echo $bitrate $y_psnr $u_psnr $v_psns $yuv_psnr
    echo -e $bitrate $y_psnr $u_psnr $v_psns $yuv_psnr >> "$current_out"	
#    echo -e $total_bits $total_psnr >> "$current_out"

done # qp loop

 

#echo -e "==========Case done=============" >> "$current_out"





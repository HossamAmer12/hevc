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

   # echo $noQp
fi



done             # $@ sees arguments as separate words. 

current_keyword=$current_yuv$current_caseId
#echo $current_keyword




# Select the number of POCS for a specific sequence and case ID
noPOCs=$(grep $current_keyword $inputPOCFileName| awk '{print $2}')

# Loop on the POCs and output the statisics for every Qps

startPocIndex=4
endPocIndex=5
for ((i = 1; i<=noPOCs;i++))
do
  
  
  #current_poc=$(grep $current_keyword $inputPOCFileName| awk '{print $2}')
  #current_poc=$(grep $current_keyword $inputPOCFileName)
  #current_poc=$(grep $current_keyword $inputPOCFileName| tr '{' ' ')
  #awk '{for(i=2;i<=NF;i++){printf "%s ", $i}; printf "\n"}'
  #current_poc=$(grep $current_keyword $inputPOCFileName| \
  #            awk '{for(p=2;i<=NF;i++){printf "%s ", $p}; printf "\n"}')

#f=4
#current_poc=$(grep $current_keyword $inputPOCFileName| \
 #             awk -v jj=$f '{for(p=4;p<5;p++){printf "%s ", $p}; printf "\n"}')

# Select the current POC
# http://evc-cit.info/cit052/pass_to_awk.html
current_poc_helper=$(grep $current_keyword $inputPOCFileName| \
              awk -v p=$startPocIndex -v n=$endPocIndex '{for(i=p;i<n;i++){printf "%s ", $i}; printf "\n"}')

  #echo $current_poc_helper

 let "startPocIndex+=1" # Increment by 1 to get the next POC
 let "endPocIndex+=1" # Increment by 2 to get all coulmns


  #Output file
  #current_out=Gen/Seq-FramesStat/$current_caseId"_"$current_poc_helper"_"$current_yuv.txt
  current_out=Gen/Seq-FramesStat/$current_yuv/$current_caseId"_"$current_poc_helper"_"$current_yuv.txt
 # echo "POC Qp SliceType" "Bits" "Y-PSNR" > "$current_out"
    
  # Adjust the spaces for the keyword
  if [ "$current_poc_helper" -lt 10 ] ; then  
    current_poc=$(echo "POC    "$current_poc_helper)
  elif [ "$current_poc_helper" -lt 100 ] ; then  
    current_poc=$(echo "POC   "$current_poc_helper)
  elif [ "$current_poc_helper" -lt 1000 ] ; then  
    current_poc=$(echo "POC  "$current_poc_helper)
  else
    current_poc=$(echo "POC "$current_poc_helper) # Mini-Static thing
  fi
  
  #echo $current_poc  
 
  # Select the sliceType, bits, yuv_psnr for every qp
  for ((j = 1; j<=noQp;j++))
  do
   current_parse=Gen/Seq-TXT/$current_yuv"_"${Qp[j]}"_"$current_caseId.txt

    poc=$(grep "$current_poc" $current_parse| awk '{print $2}')
    #echo $poc


    sliceType=$(grep "$current_poc"  $current_parse| awk '{print $6}')
    #echo $sliceType


    qp=$(grep "$current_poc"  $current_parse| awk '{print $10}')
    #echo $qp


    bits=$(grep "$current_poc"  $current_parse| awk '{print $12}')
    #echo $bits

  

    y_pnsr=$(grep "$current_poc"  $current_parse| awk '{print $15}')
    #echo $y_pnsr

      # Append to the file
      #echo "$poc   $qp  $sliceType $bits $y_pnsr" >> "$current_out"
      echo -e "$bits\t\t\t\t$y_pnsr" >> "$current_out"

    done  

done  






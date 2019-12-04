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
#if [ "$argIndex" == 4 ] && [ "$arg" != "@" ]  ; then  
#  inputPOCFileName=$arg

   # echo $noQp
#fi



done             # $@ sees arguments as separate words. 

current_keyword=$current_yuv$current_caseId

#echo "current_keyword->"$current_keyword

# Debug
#noPOCs=20
#noQp=1


#Output file
#current_out=Gen/Seq-FramesStat/Union"_"$current_yuv.txt
current_out=Gen/Seq-FramesStat/TimeAnalysis.txt
echo $current_out


#echo -e "***********$current_yuv Sequence***********" >> "$current_out"
 for ((j = 1; j<=noQp;j++))
  do

    #echo -e "(--*--*-*-*-)Qp ${Qp[j]}(--*--*-*-*-)" >> "$current_out"
   current_parse=Gen/Seq-TXT/$current_yuv"_"${Qp[j]}"_"$current_caseId.txt

   
  current_keyword2="Total Time:" # j is the Qp clock
  t=$(grep "$current_keyword2" $current_parse| awk '{print $3}')

#echo -e $current_yuv"\t"$t >> "$current_out"
    echo -e $t >> "$current_out"


done  

# Matching count
#grep -w -c "Total Time" Gen/Seq-TXT/Kimono1_1920x1080_24_22_1.txt
# match the pattern
#grep -e "Total Time: " Gen/Seq-TXT/Kimono1_1920x1080_24_22_1.txt

#echo -e "==========Case done=============" >> "$current_out"





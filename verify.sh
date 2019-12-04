
# Get the inputFile for YUVs
inputYUVFileName=Gen/Input-Sequnces/$1.txt

# Get the inputFile for GOPs
inputGOPFileName=Gen/GOP-Types/$2.txt



# Index of the given argument by the top shell file
argIndex=0


# Index of the CFG array
qpIndex=1 #Start from 1 because you already started from 1


# Get the current YUV file
current_yuv=$1


# Get the number of sequences
noSeq=$(cat $inputYUVFileName | wc -l )
# echo $noSeq
#echo Please enter the number of Sequences to encode
#read -e noSeq


# Number of Encoder CFG files you would like to run on a sequence
#echo How many encoder CFG files you would like to run on a sequence?
#read -e noCases

# Get the number of cases
noCases=$(cat $inputGOPFileName | wc -l )

# Get the number of Qps
echo How many Qp values do you use for encoding?
read -e noQp

# Get the first Qp
echo Please enter the start of the Qp range
read -e startQp

# Get the Qp step size
echo Please enter your Qp step size
read -e stepSizeQp


# http://unix.stackexchange.com/questions/88100/importing-data-from-a-text-file-to-a-bash-script
declare -a yuv_symbols=($(cat $inputYUVFileName| tr '\n' ' '))

# Read YUVs from TXT file
i=1
j=0
#loopCount=$(($noSeq*2))

for (( i = 1; i <= noSeq; i++ ))
do
  # echo ${yuv_symbols[$j]}
  
  yuv_file[$i]=${yuv_symbols[j]}
    # echo ${yuv_file[$i]}


   let "j+=1" # Increment by 2 to get all columns
   # echo ${yuv_symbols[$j]}
  
   cfg_file[$i]=${yuv_symbols[j]}
   let "j+=1" # Increment by 2 to get all columns
   # echo ${cfg_file[$i]}
   
done


#**********************

# To make it start with startQp
scaleQpIndex=0
#Create the Qp range
for ((i = 1; i<=noQp;i++))
do
  Qp[$i]=$(($startQp + $scaleQpIndex*$stepSizeQp))
  let "scaleQpIndex+=1"

done  

#**********************

# Get the GOP structure names
declare -a gop_type_files=($(cat $inputGOPFileName| tr '\n' ' '))

txt_fileNamesIndex=1
# Parse to get the txt_fileNames
for (( i = 1; i <= noSeq; i++ ))
do

  current_yuv="${yuv_file[$i]}"

  
  # For every case
  for (( caseId = 1; caseId <= noCases; caseId++ ))
  do
    # For every Qp value
    for (( qpId = 1; qpId <= noQp; qpId++ ))
    do
    
      txt_fileNames[txt_fileNamesIndex]=$current_yuv"_"${Qp[$qpId]}"_"$caseId

      #echo ${cfg_file[$i]}
      #echo ${txt_fileNames[$txt_fileNamesIndex]}
      let "txt_fileNamesIndex+=1" 
    done
  done    
done


######################## PARSING ###################################
## Start parsing and get the bitrates and PSNR and encoding time
# HACK!!!!! XXXXX
# 24 sequences
#txt_fileNamesIndex=24
# how to find the array size *******
#sizeTexts=${#txt_fileNames[@]}
#XXXXXXXX HARD CODE
#noSeqTemp=$3
noSeqTemp=cat ${inputYUVFileName} | wc -l
result=$(($noSeqTemp * $noCases))
sizeTexts=$(($result * $noQp))

qpClock=1
current_out=Gen/Seq-FramesStat/Verify.txt

gopClock=1
yuvClock=1


#for ((parse = 1; parse<=txt_fileNamesIndex;parse++))
for ((parse = 1; parse<=sizeTexts;parse++))
do
  current_parse=Gen/Seq-TXT/${txt_fileNames[$parse]}.txt
  #echo $current_parse
  #echo $qpClock

 # echo $qpClock
  # Put the sequence name in the begining 
  if [ $qpClock -eq 1 ]; then
   #current_yuv="${yuv_file[$yuvClock]}"
   echo -e "******************" >> "$current_out"
   echo -e "==================" >> "$current_out"
   echo -e $current_parse >> "$current_out"
   #echo -e  "Bitrate\t\tY-PSNR\tU-PSNR\tV-PSNR\tYUV-PSNR\tTime" >> "$current_out"
   echo -e  "Bitrate\t\tY-PSNR\tU-PSNR\tV-PSNR\tTime" >> "$current_out"
   #echo bla
  fi

    current_keyword2="Bitrate" # j is the Qp clock

    bitrate=$(grep -A1 $current_keyword2 $current_parse|grep -v $current_keyword2 \
            | head -1 |awk '{print $3}')
  
    #y_psnr=$(grep -A1 $current_keyword2 $current_parse|grep -v $current_keyword2 \
     #       | head -1 |awk '{print $4}')
  
  yPnsr=$(grep -A1 $current_keyword2 $current_parse|grep -v $current_keyword2 \
            | head -1 |awk '{print $4}')
 

    u_psnr=$(grep -A1 $current_keyword2 $current_parse|grep -v $current_keyword2 \
            | head -1 |awk '{print $5}')
  
    v_psnr=$(grep -A1 $current_keyword2 $current_parse|grep -v $current_keyword2 \
            | head -1 |awk '{print $6}')

    #yuv_psnr=$(grep -A1 $current_keyword2 $current_parse|grep -v $current_keyword2 \
     #       | head -1 |awk '{print $7}')


     #echo $bitrate
    #echo $yPnsr
     # echo $u_psnr
     # echo $v_psnr
     # echo $yuv_psnr
     current_keyword2="Total Time:" # j is the Qp clock
     t=$(grep "$current_keyword2" $current_parse| awk '{print $3}')

    #  echo $t

  # Dump the values
  #echo -e "$bitrate\t$yPnsr\t$u_psnr\t$v_psnr\t$yuv_psnr\t$t" >> "$current_out"
  echo -e "$bitrate\t$yPnsr\t$u_psnr\t$v_psnr\t$t" >> "$current_out"

  let "qpClock+=1" 

  # reset the clock
  if [ "$qpClock" -gt $noQp ] ; then  
      qpClock=1
      #let "yuvClock+=1" 
  fi   


done

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

echo $current_keyword




# Select the number of POCS for a specific sequence and case ID
noPOCs=$(grep $current_keyword $inputPOCFileName| awk '{print $2}')

# Debug
#noPOCs=20
noQp=1


#Output file
#current_out=Gen/Seq-FramesStat/Union"_"$current_yuv.txt
current_out=Gen/Seq-FramesStat/IntFileQPFrameRef.txt

# At a given YUV file, GOP, get the bits for all the frames 
# Put them in a file
  for ((j = 1; j<=noQp;j++))
  do
   current_parse=Gen/Seq-TXT/$current_yuv"_"${Qp[j]}"_"$current_caseId.txt
   echo $current_parse

   echo -e "(--*--*-*-*-)Qp ${Qp[j]}(--*--*-*-*-)" >> "$current_out"
   echo -e "----------FrameNumber FrameType FrameRefs----------" >> "$current_out"

    for ((i = 0; i<noPOCs;i++))
    do

    # Select the current POC
    # http://evc-cit.info/cit052/pass_to_awk.html
    current_poc_helper=$i

      #echo $current_poc_helper

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
    poc=$(grep "$current_poc" $current_parse| awk '{print $2}')
    #echo $poc


    sliceType=$(grep "$current_poc"  $current_parse| awk '{print $6}')
    #echo $sliceType


    qp=$(grep "$current_poc"  $current_parse| awk '{print $10}')
    # echo $qp


    #echo "bla bla"
    #echo $current_poc
    #echo $i 
    #echo $noPOCs
    #read -e nlo


    bits=$(grep "$current_poc"  $current_parse| awk '{print $12}')
    #echo $bits

    y_pnsr=$(grep "$current_poc"  $current_parse| awk '{print $15}')
    #echo $y_pnsr

    ref1=$(grep "$current_poc"  $current_parse| awk '{print $27}')
    #echo $ref1
    #read -e amal

    # If no reference 1, set to -1
    if [ "$ref1" == "]" ]  ; then  
      let "ref1=-1"  
    fi


    ref2=$(grep "$current_poc"  $current_parse| awk '{print $28}')
    #echo $ref2

    # If no reference i, set to -1
    if [ "$ref1" == -1 ] || [ "$ref2" == "]" ]  ; then
      let "ref2=-1"  
    fi

    ref3=$(grep "$current_poc"  $current_parse| awk '{print $29}') 
    #echo $ref3

    if [ "$ref2" == -1 ] || [ "$ref3" == "]" ]  ; then
      let "ref3=-1"  
    fi


    ref4=$(grep "$current_poc"  $current_parse| awk '{print $30}')

    if [ "$ref3" == -1 ] || [ "$ref4" == "]" ]  ; then
      let "ref4=-1"  
    fi
    
    #echo $poc "---"$ref1 $ref2 $ref3 $ref4

     # WRITE to File!
     echo -e F"$i-$j\t\t\t\t$sliceType\t\t\t\t$ref1\t$ref2\t$ref3\t$ref4" >> "$current_out"
  
    done


done  


########### FULLL STATS ##############
# Full file
current_out2=Gen/Seq-FramesStat/QPFrameRef.txt

  
  echo -e "***********$current_yuv Sequence***********" >> "$current_out2"
  for ((j = 1; j<=noQp;j++))
  do
   current_parse=Gen/Seq-TXT/$current_yuv"_"${Qp[j]}"_"$current_caseId.txt
   echo $current_parse

   echo -e "(--*--*-*-*-)Qp ${Qp[j]}(--*--*-*-*-)" >> "$current_out2"
   echo -e "----------FrameNumber FrameType FrameRefs RefFrequency QP----------" >> "$current_out2"

    for ((i = 0; i<noPOCs;i++))
    do

    # Select the current POC
    # http://evc-cit.info/cit052/pass_to_awk.html
    current_poc_helper=$i

      #echo $current_poc_helper

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
    poc=$(grep "$current_poc" $current_parse| awk '{print $2}')
    #echo $poc


    sliceType=$(grep "$current_poc"  $current_parse| awk '{print $6}')
    #echo $sliceType


    qp=$(grep "$current_poc"  $current_parse| awk '{print $10}')
    # echo $qp


    #echo "bla bla"
    #echo $current_poc
    #echo $i 
    #echo $noPOCs
    #read -e nlo


    bits=$(grep "$current_poc"  $current_parse| awk '{print $12}')
    #echo $bits

    y_pnsr=$(grep "$current_poc"  $current_parse| awk '{print $15}')
    #echo $y_pnsr

    ref1=$(grep "$current_poc"  $current_parse| awk '{print $27}')
    #echo $ref1
    #read -e amal

    # If no reference 1, set to -1
    if [ "$ref1" == "]" ]  ; then  
      let "ref1=-1"  
    fi


    ref2=$(grep "$current_poc"  $current_parse| awk '{print $28}')
    #echo $ref2

    # If no reference i, set to -1
    if [ "$ref1" == -1 ] || [ "$ref2" == "]" ]  ; then
      let "ref2=-1"  
    fi

    ref3=$(grep "$current_poc"  $current_parse| awk '{print $29}') 
    #echo $ref3

    if [ "$ref2" == -1 ] || [ "$ref3" == "]" ]  ; then
      let "ref3=-1"  
    fi


    ref4=$(grep "$current_poc"  $current_parse| awk '{print $30}')

    if [ "$ref3" == -1 ] || [ "$ref4" == "]" ]  ; then
      let "ref4=-1"  
    fi
   
      current_parse2=$current_out
      # Reset the refCount
      refCount=0
       
        for ((otherFrame = 0; otherFrame<noPOCs;otherFrame++))
        do
          current_keyword=F$otherFrame-$j # j is the Qp clock
          
          # Get the references of other frames
          # Depeneds on GOP size = 4
          r1=$(grep $current_keyword $current_parse2| awk '{print $3}')
          r2=$(grep $current_keyword $current_parse2| awk '{print $4}')
          r3=$(grep $current_keyword $current_parse2| awk '{print $5}')
          r4=$(grep $current_keyword $current_parse2| awk '{print $6}')

          #echo $current_keyword---$current_parse2
          #echo $r1
          #echo $r2
          #echo $r3
          #echo $r4

          #Check whether the poc is included in this set
          # If no reference 1, set to -1
          if [ "$r1" == $i ] || [ "$r2" == $i ]   || [ "$r3" == $i ]   || [ "$r4" == $i ]    ; then  
              let "refCount+=1"  
          fi

        done

          #echo $refCount
           
           echo -e F"$i-$j\t\t\t\t$sliceType\t\t\t\t$ref1\t$ref2\t$ref3\t$ref4\t$refCount\t$qp" >> "$current_out2"
      # done

    #read -e amal

     # WRITE to File!
    # echo -e "$i\t\t\t\t$sliceType\t\t\t\t$ref1\t$ref2\t$ref3\t$ref4" >> "$current_out"
  
    done


done 



echo -e "==========Case done=============" >> "$current_out"





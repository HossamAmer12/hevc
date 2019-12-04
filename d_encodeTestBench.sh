


# Number of Sequences
noSeq=$1 #Send it as the first var we raya7 demaa3'ak

# Used to loop on the list of arguments from the top file
index=1
# Index of the given argument by the top shell file
argIndex=0

# Index of the YUV array
yuvIndex=1 #Start from 1 because you already started from 1

# Index of the CFG array
cfgIndex=1 #Start from 1 because you already started from 1

# Index of the Qp array
qpIndex=1 #Start from 1 because you already started from 1


#echo "Listing args with \"\$@\":"

printf "\n"
echo "Encoder TestBench: Populating lists will start"

# ./d_codeTestBench.sh (0) $noSeq @ (1) "${yuv_file[@]}" @ (2) "${cfg_file[@]}" 
#                             @ (3) "${Qp[@]}" @ (4) $noCases @ (5) noQp


# Parse the arguments to get the array of YUVs, Sequence CFGs
for arg in "$@"
do

# Found a seperator --> Found a new arg
if [ "$arg" == "@" ]  ; then  
	let "argIndex+=1"
fi

# Filter the 2nd argument (YUV_Array) sent and populate it in the list
if [ "$argIndex" == 1 ] && [ "$arg" != "@" ]  ; then  
  	# echo "Arg  #$index = $arg"
  	yuv_file[$yuvIndex]=$arg
  	# echo ${yuv_file[$yuvIndex]}
  	let "yuvIndex+=1"
fi

# Filter the 3rd argument (CFG_Array) sent and populate it in the list
if [ "$argIndex" == 2 ] && [ "$arg" != "@" ]  ; then  
  cfg_file[$cfgIndex]=$arg
  # echo ${cfg_file[$cfgIndex]}
  let "cfgIndex+=1"
fi

# Filter the 3rd argument (Qp_Array) sent and populate it in the list
if [ "$argIndex" == 3 ] && [ "$arg" != "@" ]  ; then  
  Qp[$qpIndex]=$arg
  # echo ${Qp[$qpIndex]}
  let "qpIndex+=1"
fi

# Get the number of cases
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
# if [ "$argIndex" == 6 ] && [ "$arg" != "@" ]  ; then  
 # gop_str_type=$arg
 # echo $gop_str_type
# fi


done             # $@ sees arguments as separate words. 

# Please note that I won't take the encoder CFG files because I will run 
# all available cases for Encoder CFGs in a loop (for each GOP_STR_TYPE)

echo "Encoder TestBench: Populating lists done"
#echo "Arg list seen as separate words."

echo "Encoder TestBench: Running for every sequence will start"


# For every YUV, CFG sequence file --> Run all cases
for (( i = 1; i <= noSeq; i++ ))
do
	current_cfg=${cfg_file[$i]}
	current_yuv=${yuv_file[$i]}

	#echo $current_yuv
	#echo $current_cfg

	# Run for all cases
	for (( caseId = 1; caseId <= noCases; caseId++ ))
	do
		

		current_enc_cfg=encoder_$caseId

		# DEBUG:
		#current_enc_cfg="encoder_case2"

		printf "\n"
		echo "---"	
		#echo "Start Case" $caseId "for" $current_yuv " sequence"
		echo "Start Case" $caseId "Out of" $noCases "for" $current_yuv " sequence"

	 ./d_maxBoundRun.sh $noSeq @ $current_yuv @ $current_cfg @ "${Qp[@]}" \
	 					@ $noCases @ $noQp @ $caseId @ $current_enc_cfg

		echo "Done with Case" $caseId "for" $current_yuv " sequence"
		echo "***********************"
		printf "\n"
	done	
done


# DEBUG: BreakPoint
# read -e bla

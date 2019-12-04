
# Number of Sequences
noSeq=$1 #Send it as the first var we raya7 demaa3'ak

# Used to loop on the list of arguments from the top file
index=1
# Index of the given argument by the top shell file
argIndex=0

# Index of the YUV array
yuvIndex=1 #Start from 1 because you already started from 1


# Index of the Qp array
qpIndex=1 #Start from 1 because you already started from 1


#echo "Listing args with \"\$@\":"

printf "\n"
echo "Decoder TestBench: Populating lists will start"

#./d_decodeTestBench.sh (0) $noSeq @ (1) "${yuv_file[@]}" @ (2) "${Qp[@]}"  \
# 					@ (3) $noCases @ (4) $noQp 

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
  #	echo ${yuv_file[$yuvIndex]}
  	let "yuvIndex+=1"
fi

# Filter the 3rd argument (Qp_Array) sent and populate it in the list
if [ "$argIndex" == 2 ] && [ "$arg" != "@" ]  ; then  
  Qp[$qpIndex]=$arg
  # echo ${Qp[$qpIndex]}
  let "qpIndex+=1"
fi

# Get the number of cases
if [ "$argIndex" == 3 ] && [ "$arg" != "@" ]  ; then  
  noCases=$arg
 # echo $noCases
fi

# Get the number of Qp values
if [ "$argIndex" == 4 ] && [ "$arg" != "@" ]  ; then  
  noQp=$arg
 # echo $noQp
fi

done             # $@ sees arguments as separate words. 

# For every YUV --> Run all cases
for (( i = 1; i <= noSeq; i++ ))
do
	current_yuv=${yuv_file[$i]}

	printf "\n"
	echo "Start Sequence" $current_yuv 
	echo "@@@@@@@@@@@@@@@@@@@@@@@"
	
	# For every case
	for (( caseId = 1; caseId <= noCases; caseId++ ))
	do
		# For every Qp value
		for (( qpId = 1; qpId <= noQp; qpId++ ))
		do
			#XXXX: This SHOULD BE CHANGED -- Hossam Amer
			# BS11Qp1=$YUV_FILE1"_"$Qp1"_"$caseId
			current_bs=$current_yuv"_"${Qp[$qpId]}"_"$caseId
		
			#RECONS11Qp1=$YUV_FILE1"_"$Qp1"_"$GOP_STR_TYPE
			current_recons=$current_yuv"_"${Qp[$qpId]}"_"$caseId

			printf "\n"
			echo "---"	
			echo "Start Case" $caseId "for Qp" ${Qp[$qpId]} "and" $current_yuv "sequence"

			./d_decodeTestBench.sh $current_bs $current_recons

			echo "Done Case" $caseId "for Qp" ${Qp[$qpId]} "and" $current_yuv "sequence"
			echo "---"	
		
		done	

		echo "Done Case" $caseId "for" $current_yuv "sequence"
		echo "@@@@@@@@@@@@@@@@@@@@@@@"
		printf "\n"
	
	done

	echo "Done Sequence" $current_yuv
	echo "***********************" 
	printf "\n"
	printf "\n"
		
done


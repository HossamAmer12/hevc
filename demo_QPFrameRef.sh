
# Get the inputFile for YUVs
inputYUVFileName=Gen/Input-Sequnces/$1.txt

# Get the inputFile for GOPs
inputGOPFileName=Gen/GOP-Types/$2.txt


# Get the inputFile for POCs
inputPOCFileName=Gen/Input-FrameStat/$3.txt

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
# echo $noCases


# Get the number of Qps
echo How many Qp values do you use for encoding?
read -e noQp

# Get the first Qp
echo Please enter the start of the Qp range
read -e startQp

# Get the Qp step size
echo Please enter your Qp step size
read -e stepSizeQp

# echo “Reminder: This bash file takes a parameter which case”

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


   let "j+=1" # Increment by 2 to get all coulmns
   # echo ${yuv_symbols[$j]}
	
   cfg_file[$i]=${yuv_symbols[j]}
   let "j+=1" # Increment by 2 to get all coulmns
   # echo ${cfg_file[$i]}
   
done


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

noCases=1
for (( i = 1; i <= noSeq; i++ ))
do

	current_yuv="${yuv_file[$i]}"
	echo $current_yuv

	
	# For every case
	for (( caseId = 1; caseId <= noCases; caseId++ ))
	do
		# For every Qp value
		for (( qpId = 1; qpId <= noQp; qpId++ ))
		do
		
			txt_fileNames[txt_fileNamesIndex]=$current_yuv"_"${Qp[$qpId]}"_"$caseId
			let "txt_fileNamesIndex+=1" 
		done
	done		
done


echo "#******#******#******#******#******#******#******#******#******#******" 					


# Loop on the sequences for every case
for (( i = 1; i <= noSeq; i++ ))
do

	current_yuv="${yuv_file[$i]}"
	echo $current_yuv

	#Output file
	#current_out=Gen/Seq-FramesStat/Union"_"$current_yuv.txt
	current_out=Gen/Seq-FramesStat/IntFileQPFrameRef.txt

	echo -e "***********$current_yuv Sequence***********" >> "$current_out"

	# For every case
	for (( caseId = 1; caseId <= noCases; caseId++ ))
	do
	# Put a seperator between array arguments
	./d_QPFrameRef.sh $current_yuv @ $caseId @ "${Qp[@]}"  \
 					@ $noQp @ $inputPOCFileName

	done


done 

echo "Joint distribution of QP Verses References all Done"
echo "#******#******#******#******#******#******#******#******#******#******"





#******#******#******#******#******#******#******#******#******#******


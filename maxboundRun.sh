

# Get the Sequence config filename
printf "\n"
#echo “Please enter the Sequence configuration filename without extention”
#read -e CFG_FILE
CFG_FILE=$1


# Get the YUV filename
#echo “Please enter the Encoder configuration filename without extention”
#read -e ENC_CFG_FILE
ENC_CFG_FILE=$2

# Get the YUV filename
#echo “Please enter the YUV filename without extention”
#read -e YUV_FILE
YUV_FILE=$3


# Set QP range from 0 -> 51 ... 5 QP's [25, 45]
Qp1=25
Qp2=30
Qp3=35
Qp4=40
Qp5=45


# Get Which GOP structure type you will run
#printf "Please enter GOP structure type number: "
#printf " %d" 1
#printf " -> SCD, "
#printf " %d" 2
#printf " -> Even Distributed, "
#printf " %d" 3
#printf " -> Even Dis + A Pre frame\n"
#read -e GOP_STR_TYPE
GOP_STR_TYPE=$4


# Print a new line
printf "\n"

# Set the BS file output name for 5 Qps
echo BS Output has this format YUV_FILE_QP_GOP_STR_TYPE
BS1=$YUV_FILE"_"$Qp1"_"$GOP_STR_TYPE
BS2=$YUV_FILE"_"$Qp2"_"$GOP_STR_TYPE
BS3=$YUV_FILE"_"$Qp3"_"$GOP_STR_TYPE
BS4=$YUV_FILE"_"$Qp4"_"$GOP_STR_TYPE
BS5=$YUV_FILE"_"$Qp5"_"$GOP_STR_TYPE


# Set the BS file output name for 5 Qps
echo TXT Output has this format TXTnum_YUV_FILE_QP_GOP_STR_TYPE
TXT1=$YUV_FILE"_"$Qp1"_"$GOP_STR_TYPE
TXT2=$YUV_FILE"_"$Qp2"_"$GOP_STR_TYPE
TXT3=$YUV_FILE"_"$Qp3"_"$GOP_STR_TYPE
TXT4=$YUV_FILE"_"$Qp4"_"$GOP_STR_TYPE
TXT5=$YUV_FILE"_"$Qp5"_"$GOP_STR_TYPE


# Run 1: Qp = 25
#./TAppEncoder -c cfg/$ENC_CFG_FILE.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/$YUV_FILE.yuv -f 1 -q $Qp1 -b Gen/Seq-265/$BS1.265 > Gen/Seq-TXT/$TXT1.txt
./TAppEncoder -c cfg/$ENC_CFG_FILE.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/$YUV_FILE.yuv -q $Qp1 -b Gen/Seq-265/$BS1.265 > Gen/Seq-TXT/$TXT1.txt


printf "\n"
echo "Done with Run 1: Qp = 25 for" $YUV_FILE " sequence"


# Run 2: Qp = 30
#./TAppEncoder -c cfg/$ENC_CFG_FILE.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/$YUV_FILE.yuv -f 1 -q $Qp2 -b Gen/Seq-265/$BS2.265 > Gen/Seq-TXT/$TXT2.txt
./TAppEncoder -c cfg/$ENC_CFG_FILE.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/$YUV_FILE.yuv -q $Qp2 -b Gen/Seq-265/$BS2.265 > Gen/Seq-TXT/$TXT2.txt
echo "Done with Run 2: Qp = 30 for" $YUV_FILE " sequence"



# Run 3: Qp = 35
#./TAppEncoder -c cfg/$ENC_CFG_FILE.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/$YUV_FILE.yuv -f 1 -q $Qp3 -b Gen/Seq-265/$BS3.265 > Gen/Seq-TXT/$TXT3.txt
./TAppEncoder -c cfg/$ENC_CFG_FILE.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/$YUV_FILE.yuv -q $Qp3 -b Gen/Seq-265/$BS3.265 > Gen/Seq-TXT/$TXT3.txt
echo "Done with Run 3: Qp = 35 for" $YUV_FILE " sequence"



# Run 4: Qp = 40
#./TAppEncoder -c cfg/$ENC_CFG_FILE.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/$YUV_FILE.yuv -f 1 -q $Qp4 -b Gen/Seq-265/$BS4.265 > Gen/Seq-TXT/$TXT4.txt
./TAppEncoder -c cfg/$ENC_CFG_FILE.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/$YUV_FILE.yuv -q $Qp4 -b Gen/Seq-265/$BS4.265 > Gen/Seq-TXT/$TXT4.txt
echo "Done with Run 4: Qp = 40 for" $YUV_FILE " sequence"




# Run 5: Qp = 45
#./TAppEncoder -c cfg/$ENC_CFG_FILE.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/$YUV_FILE.yuv -f 1 -q $Qp5 -b Gen/Seq-265/$BS5.265 > Gen/Seq-TXT/$TXT5.txt
./TAppEncoder -c cfg/$ENC_CFG_FILE.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/$YUV_FILE.yuv -q $Qp5 -b Gen/Seq-265/$BS5.265 > Gen/Seq-TXT/$TXT5.txt


printf "\n"
echo "Done with 5 Qp Runs for" $YUV_FILE " sequence"


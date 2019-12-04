
# Set QP range from 0 -> 51 ... 5 QP's [25, 45]
Qp1=25
Qp2=30
Qp3=35
Qp4=40
Qp5=45

# 2 attributes
# $1 = YUV_FILE1
# $2 = YUV_FILE2

# Docs: From the Encoder:
# BS1=$YUV_FILE"_"$Qp1"_"$GOP_STR_TYPE

# Path of BS files: Gen/Seq-265/

YUV_FILE1=Keiba_416x240_30
YUV_FILE2=hall_monitor_CIF

#YUV_FILE1=BasketballDrill_832x480_50
#YUV_FILE2=BQMall_832x480_60

#Setting of the BS files for sequence 1 for 5 cases
GOP_STR_TYPE=1
BS11Qp1=$YUV_FILE1"_"$Qp1"_"$GOP_STR_TYPE
BS11Qp2=$YUV_FILE1"_"$Qp2"_"$GOP_STR_TYPE
BS11Qp3=$YUV_FILE1"_"$Qp3"_"$GOP_STR_TYPE
BS11Qp4=$YUV_FILE1"_"$Qp4"_"$GOP_STR_TYPE
BS11Qp5=$YUV_FILE1"_"$Qp5"_"$GOP_STR_TYPE

GOP_STR_TYPE=2
BS12Qp1=$YUV_FILE1"_"$Qp1"_"$GOP_STR_TYPE
BS12Qp2=$YUV_FILE1"_"$Qp2"_"$GOP_STR_TYPE
BS12Qp3=$YUV_FILE1"_"$Qp3"_"$GOP_STR_TYPE
BS12Qp4=$YUV_FILE1"_"$Qp4"_"$GOP_STR_TYPE
BS12Qp5=$YUV_FILE1"_"$Qp5"_"$GOP_STR_TYPE


GOP_STR_TYPE=3
BS13Qp1=$YUV_FILE1"_"$Qp1"_"$GOP_STR_TYPE
BS13Qp2=$YUV_FILE1"_"$Qp2"_"$GOP_STR_TYPE
BS13Qp3=$YUV_FILE1"_"$Qp3"_"$GOP_STR_TYPE
BS13Qp4=$YUV_FILE1"_"$Qp4"_"$GOP_STR_TYPE
BS13Qp5=$YUV_FILE1"_"$Qp5"_"$GOP_STR_TYPE


#Sequence 1: Setting the RECONS YUV filenames for 5 cases

GOP_STR_TYPE=1
RECONS11Qp1=$YUV_FILE1"_"$Qp1"_"$GOP_STR_TYPE
RECONS11Qp2=$YUV_FILE1"_"$Qp2"_"$GOP_STR_TYPE
RECONS11Qp3=$YUV_FILE1"_"$Qp3"_"$GOP_STR_TYPE
RECONS11Qp4=$YUV_FILE1"_"$Qp4"_"$GOP_STR_TYPE
RECONS11Qp5=$YUV_FILE1"_"$Qp5"_"$GOP_STR_TYPE


GOP_STR_TYPE=2
RECONS12Qp1=$YUV_FILE1"_"$Qp1"_"$GOP_STR_TYPE
RECONS12Qp2=$YUV_FILE1"_"$Qp2"_"$GOP_STR_TYPE
RECONS12Qp3=$YUV_FILE1"_"$Qp3"_"$GOP_STR_TYPE
RECONS12Qp4=$YUV_FILE1"_"$Qp4"_"$GOP_STR_TYPE
RECONS12Qp5=$YUV_FILE1"_"$Qp5"_"$GOP_STR_TYPE

GOP_STR_TYPE=3
RECONS13Qp1=$YUV_FILE1"_"$Qp1"_"$GOP_STR_TYPE
RECONS13Qp2=$YUV_FILE1"_"$Qp2"_"$GOP_STR_TYPE
RECONS13Qp3=$YUV_FILE1"_"$Qp3"_"$GOP_STR_TYPE
RECONS13Qp4=$YUV_FILE1"_"$Qp4"_"$GOP_STR_TYPE
RECONS13Qp5=$YUV_FILE1"_"$Qp5"_"$GOP_STR_TYPE

GOP_STR_TYPE=4
RECONS14Qp1=$YUV_FILE1"_"$Qp1"_"$GOP_STR_TYPE
RECONS14Qp2=$YUV_FILE1"_"$Qp2"_"$GOP_STR_TYPE
RECONS14Qp3=$YUV_FILE1"_"$Qp3"_"$GOP_STR_TYPE
RECONS14Qp4=$YUV_FILE1"_"$Qp4"_"$GOP_STR_TYPE
RECONS14Qp5=$YUV_FILE1"_"$Qp5"_"$GOP_STR_TYPE

GOP_STR_TYPE=5
RECONS15Qp1=$YUV_FILE1"_"$Qp1"_"$GOP_STR_TYPE
RECONS15Qp2=$YUV_FILE1"_"$Qp2"_"$GOP_STR_TYPE
RECONS15Qp3=$YUV_FILE1"_"$Qp3"_"$GOP_STR_TYPE
RECONS15Qp4=$YUV_FILE1"_"$Qp4"_"$GOP_STR_TYPE
RECONS15Qp5=$YUV_FILE1"_"$Qp5"_"$GOP_STR_TYPE


#Setting of the BS files for sequence 2 -- 5 cases
GOP_STR_TYPE=1
BS21Qp1=$YUV_FILE2"_"$Qp1"_"$GOP_STR_TYPE
BS21Qp2=$YUV_FILE2"_"$Qp2"_"$GOP_STR_TYPE
BS21Qp3=$YUV_FILE2"_"$Qp3"_"$GOP_STR_TYPE
BS21Qp4=$YUV_FILE2"_"$Qp4"_"$GOP_STR_TYPE
BS21Qp5=$YUV_FILE2"_"$Qp5"_"$GOP_STR_TYPE

GOP_STR_TYPE=2
BS22Qp1=$YUV_FILE2"_"$Qp1"_"$GOP_STR_TYPE
BS22Qp2=$YUV_FILE2"_"$Qp2"_"$GOP_STR_TYPE
BS22Qp3=$YUV_FILE2"_"$Qp3"_"$GOP_STR_TYPE
BS22Qp4=$YUV_FILE2"_"$Qp4"_"$GOP_STR_TYPE
BS22Qp5=$YUV_FILE2"_"$Qp5"_"$GOP_STR_TYPE


GOP_STR_TYPE=3
BS23Qp1=$YUV_FILE2"_"$Qp1"_"$GOP_STR_TYPE
BS23Qp2=$YUV_FILE2"_"$Qp2"_"$GOP_STR_TYPE
BS23Qp3=$YUV_FILE2"_"$Qp3"_"$GOP_STR_TYPE
BS23Qp4=$YUV_FILE2"_"$Qp4"_"$GOP_STR_TYPE
BS23Qp5=$YUV_FILE2"_"$Qp5"_"$GOP_STR_TYPE



#Setting the RECONS YUV filenames for sequence 2 -- 5 cases
GOP_STR_TYPE=1
RECONS21Qp1=$YUV_FILE2"_"$Qp1"_"$GOP_STR_TYPE
RECONS21Qp2=$YUV_FILE2"_"$Qp2"_"$GOP_STR_TYPE
RECONS21Qp3=$YUV_FILE2"_"$Qp3"_"$GOP_STR_TYPE
RECONS21Qp4=$YUV_FILE2"_"$Qp4"_"$GOP_STR_TYPE
RECONS21Qp5=$YUV_FILE2"_"$Qp5"_"$GOP_STR_TYPE

GOP_STR_TYPE=2
RECONS22Qp1=$YUV_FILE2"_"$Qp1"_"$GOP_STR_TYPE
RECONS22Qp2=$YUV_FILE2"_"$Qp2"_"$GOP_STR_TYPE
RECONS22Qp3=$YUV_FILE2"_"$Qp3"_"$GOP_STR_TYPE
RECONS22Qp4=$YUV_FILE2"_"$Qp4"_"$GOP_STR_TYPE
RECONS22Qp5=$YUV_FILE2"_"$Qp5"_"$GOP_STR_TYPE


GOP_STR_TYPE=3
RECONS23Qp1=$YUV_FILE2"_"$Qp1"_"$GOP_STR_TYPE
RECONS23Qp2=$YUV_FILE2"_"$Qp2"_"$GOP_STR_TYPE
RECONS23Qp3=$YUV_FILE2"_"$Qp3"_"$GOP_STR_TYPE
RECONS23Qp4=$YUV_FILE2"_"$Qp4"_"$GOP_STR_TYPE
RECONS23Qp5=$YUV_FILE2"_"$Qp5"_"$GOP_STR_TYPE

GOP_STR_TYPE=4
RECONS24Qp1=$YUV_FILE2"_"$Qp1"_"$GOP_STR_TYPE
RECONS24Qp2=$YUV_FILE2"_"$Qp2"_"$GOP_STR_TYPE
RECONS24Qp3=$YUV_FILE2"_"$Qp3"_"$GOP_STR_TYPE
RECONS24Qp4=$YUV_FILE2"_"$Qp4"_"$GOP_STR_TYPE
RECONS24Qp5=$YUV_FILE2"_"$Qp5"_"$GOP_STR_TYPE

GOP_STR_TYPE=5
RECONS25Qp1=$YUV_FILE2"_"$Qp1"_"$GOP_STR_TYPE
RECONS25Qp2=$YUV_FILE2"_"$Qp2"_"$GOP_STR_TYPE
RECONS25Qp3=$YUV_FILE2"_"$Qp3"_"$GOP_STR_TYPE
RECONS25Qp4=$YUV_FILE2"_"$Qp4"_"$GOP_STR_TYPE
RECONS25Qp5=$YUV_FILE2"_"$Qp5"_"$GOP_STR_TYPE


# Run!

# Sequence 1:


./decodeTestBenchHelper.sh $BS11Qp1 $RECONS11Qp1
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp1

./decodeTestBenchHelper.sh $BS11Qp2 $RECONS11Qp2
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp2

./decodeTestBenchHelper.sh $BS11Qp3 $RECONS11Qp3
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp3

./decodeTestBenchHelper.sh $BS11Qp4 $RECONS11Qp4
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp4

./decodeTestBenchHelper.sh $BS11Qp5 $RECONS11Qp5
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp5

#==

./decodeTestBenchHelper.sh $BS12Qp1 $RECONS12Qp1
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp1

./decodeTestBenchHelper.sh $BS12Qp2 $RECONS12Qp2
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp2

./decodeTestBenchHelper.sh $BS12Qp3 $RECONS12Qp3
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp3

./decodeTestBenchHelper.sh $BS12Qp4 $RECONS12Qp4
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp4

./decodeTestBenchHelper.sh $BS12Qp5 $RECONS12Qp5
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp5

#==

./decodeTestBenchHelper.sh $BS13Qp1 $RECONS13Qp1
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp1

./decodeTestBenchHelper.sh $BS13Qp2 $RECONS13Qp2
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp2

./decodeTestBenchHelper.sh $BS13Qp3 $RECONS13Qp3
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp3

./decodeTestBenchHelper.sh $BS13Qp4 $RECONS13Qp4
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp4

./decodeTestBenchHelper.sh $BS13Qp5 $RECONS13Qp5
printf "\n"
echo "Decoded " $YUV_FILE1 " sequence and Qp = " $Qp5



#******#******#******#******#******#******#******#******#******#******


# Sequence 2:


./decodeTestBenchHelper.sh $BS21Qp1 $RECONS21Qp1
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp1

./decodeTestBenchHelper.sh $BS21Qp2 $RECONS21Qp2
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp2

./decodeTestBenchHelper.sh $BS21Qp3 $RECONS21Qp3
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp3

./decodeTestBenchHelper.sh $BS21Qp4 $RECONS21Qp4
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp4

./decodeTestBenchHelper.sh $BS21Qp5 $RECONS21Qp5
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp5

#==

./decodeTestBenchHelper.sh $BS22Qp1 $RECONS22Qp1
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp1

./decodeTestBenchHelper.sh $BS22Qp2 $RECONS22Qp2
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp2

./decodeTestBenchHelper.sh $BS22Qp3 $RECONS22Qp3
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp3

./decodeTestBenchHelper.sh $BS22Qp4 $RECONS22Qp4
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp4

./decodeTestBenchHelper.sh $BS22Qp5 $RECONS22Qp5
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp5

#==

./decodeTestBenchHelper.sh $BS23Qp1 $RECONS23Qp1
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp1

./decodeTestBenchHelper.sh $BS23Qp2 $RECONS23Qp2
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp2

./decodeTestBenchHelper.sh $BS23Qp3 $RECONS23Qp3
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp3

./decodeTestBenchHelper.sh $BS23Qp4 $RECONS23Qp4
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp4

./decodeTestBenchHelper.sh $BS23Qp5 $RECONS23Qp5
printf "\n"
echo "Decoded " $YUV_FILE2 " sequence and Qp = " $Qp5


printf "\n"
echo "All cases Decoded for two sequences"
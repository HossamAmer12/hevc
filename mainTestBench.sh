

# Get Which GOP structure type you will run
printf "Please enter GOP structure type number: "
printf " %d" 1
printf " -> SCD, "
printf " %d" 2
printf " -> Even Distributed, "
printf " %d" 3
printf " -> Even Dis + A Pre frame\n"
read -e GOP_STR_TYPE

# echo “Reminder: This bash file takes a parameter which case”

# Sequence configuration filename values:
#CFG_FILE1=BasketballDrill
#CFG_FILE2=BQMall

# Encoder configuration filename values:
#ENC_CFG_FILE1=encoder_lowdelay_main
#ENC_CFG_FILE2=encoder_lowdelay_main

# YUV filename values:
#YUV_FILE1=BasketballDrill_832x480_50
#YUV_FILE2=BQMall_832x480_60

# Sequence configuration filename values:
CFG_FILE1=Keiba
CFG_FILE2=HallMonitor

# Encoder configuration filename values:
ENC_CFG_FILE1=encoder_case2
ENC_CFG_FILE2=encoder_case2

# YUV filename values:
YUV_FILE1=Keiba_416x240_30
YUV_FILE2=hall_monitor_CIF


#################################

# Case 1


if [ "$GOP_STR_TYPE" = "1" ]; then

./codeTestBench.sh 11
printf "\n"
echo "Done with Case 1 for" $YUV_FILE1 " sequence"


./codeTestBench.sh 21
echo "Done with Case 1 for" $YUV_FILE2 " sequence"


#################################

# Case 2

else if [ "$GOP_STR_TYPE" = "2" ]; then


./codeTestBench.sh 12
#This will produce summary files containing 5 Qps- Rename them for excel sheet
echo "Done with Case 2 for" $YUV_FILE1 " sequence"


./codeTestBench.sh 22
#This will produce summary files containing 5 Qps- Rename them for excel sheet
echo "Done with Case 2 for" $YUV_FILE2 " sequence"


#################################

# Case 3

else if [ "$GOP_STR_TYPE" = "3" ]; then


./codeTestBench.sh 13
#This will produce summary files containing 5 Qps- Rename them for excel sheet
echo "Done with Case 3 for" $YUV_FILE1 " sequence"



./codeTestBench.sh 23
#This will produce summary files containing 5 Qps- Rename them for excel sheet
echo "Done with Case 3 for" $YUV_FILE2 " sequence"


fi
fi
fi

#******#******#******#******#******#******#******#******#******#******


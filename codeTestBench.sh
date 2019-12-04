

# Sequence configuration filename values:
CFG_FILE1=Keiba
CFG_FILE2=HallMonitor

# Encoder configuration filename values:
ENC_CFG_FILE1=encoder_case2
ENC_CFG_FILE2=encoder_case2

# YUV filename values:
YUV_FILE1=Keiba_416x240_30
YUV_FILE2=hall_monitor_CIF

# Start Comment
: <<'END'

if [ "$1" == "11" ] || [ "$1" == "12" ] || [ "$1" == "13" ] ; then
# Get Sequence 1 config filename
printf "\n"
echo “Please enter Sequence ONE configuration filename without extention”
CFG_FILE1=BasketballDrill
#read -e CFG_FILE1

# Get Encoder 1 configuration filename
echo “Please enter the Encoder ONE configuration filename without extention”
ENC_CFG_FILE1=encoder_lowdelay_main
#read -e ENC_CFG_FILE1


# Get YUV 1 filename
echo “Please enter the YUV filename for Sequence ONE without extention”
YUV_FILE1=BasketballDrill_832x480_50
#read -e YUV_FILE1

fi

###

if [ "$1" == "21" ] || [ "$1" == "22" ] || [ "$1" == "23" ] ; then
# Get Sequence 2 config filename
printf "\n"
echo “Please enter Sequence TWO configuration filename without extention”
CFG_FILE2=BQMall
#read -e CFG_FILE2

# Get YUV 2 filename
echo “Please enter the Encoder TWO configuration filename without extention”
read -e ENC_CFG_FILE2


# Get YUV 2 filename
echo “Please enter the YUV filename for Sequence TWO without extention”
read -e YUV_FILE2

fi

END

########### Sequence 1######################
# $1 = CFG_FILE
# $2 = ENC_CFG_FILE
# $3 = YUV_FILE
# $4 = GOP_STR_TYPE


# Case 1

# Start Comment
#: <<'END'

if [ "$1" = "11" ]; then

GOP_STR_TYPE1=1
./maxBoundRun.sh $CFG_FILE1 $ENC_CFG_FILE1 $YUV_FILE1 $GOP_STR_TYPE1

#This will produce summary files containing 5 Qps- Rename them for excel sheet

# Rename the summary files to avoid overwriting
mv summaryTotal.txt "SumTot_"$YUV_FILE1"_"$GOP_STR_TYPE1.txt
mv summary_I.txt "SumI_"$YUV_FILE1"_"$GOP_STR_TYPE1.txt
mv summary_P.txt "SumP_"$YUV_FILE1"_"$GOP_STR_TYPE1.txt
mv summary_B.txt "SumB_"$YUV_FILE1"_"$GOP_STR_TYPE1.txt

printf "\n"
echo "Done with Case 1 for" $YUV_FILE1 " sequence"

# End comment
#END

# Case 2

else if [ "$1" = "12" ]; then

# Start Comment
#: <<'END'


GOP_STR_TYPE2=2
./maxBoundRun.sh $CFG_FILE1 $ENC_CFG_FILE1 $YUV_FILE1 $GOP_STR_TYPE2

#This will produce summary files containing 5 Qps- Rename them for excel sheet

# Rename the summary files to avoid overwriting
mv summaryTotal.txt "SumTot_"$YUV_FILE1"_"$GOP_STR_TYPE2.txt
mv summary_I.txt "SumI_"$YUV_FILE1"_"$GOP_STR_TYPE2.txt
mv summary_P.txt "SumP_"$YUV_FILE1"_"$GOP_STR_TYPE2.txt
mv summary_B.txt "SumB_"$YUV_FILE1"_"$GOP_STR_TYPE2.txt


echo "Done with Case 2 for" $YUV_FILE1 " sequence"

# End comment
#END

# Case 3

else if [ "$1" = "13" ]; then

# Start Comment
#: <<'END'


GOP_STR_TYPE3=3
./maxBoundRun.sh $CFG_FILE1 $ENC_CFG_FILE1 $YUV_FILE1 $GOP_STR_TYPE3

#This will produce summary files containing 5 Qps- Rename them for excel sheet

# Rename the summary files to avoid overwriting
mv summaryTotal.txt "SumTot_"$YUV_FILE1"_"$GOP_STR_TYPE3.txt
mv summary_I.txt "SumI_"$YUV_FILE1"_"$GOP_STR_TYPE3.txt
mv summary_P.txt "SumP_"$YUV_FILE1"_"$GOP_STR_TYPE3.txt
mv summary_B.txt "SumB_"$YUV_FILE1"_"$GOP_STR_TYPE3.txt

echo "Done with Case 3 for" $YUV_FILE1 " sequence"

# End comment
#END


########### Sequence 1######################

#******#******#******#******#******#******#******#******#******#******

########### Sequence 2######################
# $1 = CFG_FILE
# $2 = ENC_CFG_FILE
# $3 = YUV_FILE
# $4 = GOP_STR_TYPE

# Case 1

else if [ "$1" = "21" ]; then

# Start Comment
#: <<'END'

GOP_STR_TYPE1=1
./maxBoundRun.sh $CFG_FILE2 $ENC_CFG_FILE2 $YUV_FILE2 $GOP_STR_TYPE1

#This will produce summary files containing 5 Qps- Rename them for excel sheet

# Rename the summary files to avoid overwriting
mv summaryTotal.txt "SumTot_"$YUV_FILE2"_"$GOP_STR_TYPE1.txt
mv summary_I.txt "SumI_"$YUV_FILE2"_"$GOP_STR_TYPE1.txt
mv summary_P.txt "SumP_"$YUV_FILE2"_"$GOP_STR_TYPE1.txt
mv summary_B.txt "SumB_"$YUV_FILE2"_"$GOP_STR_TYPE1.txt

echo "Done with Case 1 for" $YUV_FILE2 " sequence"

# End comment
#END


# Case 2

else if [ "$1" = "22" ]; then

# Start Comment
#: <<'END'

GOP_STR_TYPE2=2
./maxBoundRun.sh $CFG_FILE2 $ENC_CFG_FILE2 $YUV_FILE2 $GOP_STR_TYPE2

#This will produce summary files containing 5 Qps- Rename them for excel sheet

# Rename the summary files to avoid overwriting
mv summaryTotal.txt "SumTot_"$YUV_FILE2"_"$GOP_STR_TYPE2.txt
mv summary_I.txt "SumI_"$YUV_FILE2"_"$GOP_STR_TYPE2.txt
mv summary_P.txt "SumP_"$YUV_FILE2"_"$GOP_STR_TYPE2.txt
mv summary_B.txt "SumB_"$YUV_FILE2"_"$GOP_STR_TYPE2.txt

echo "Done with Case 2 for" $YUV_FILE2 " sequence"

# End comment
#END


# Case 3

else if [ "$1" = "23" ]; then
# Start Comment
#: <<'END'

GOP_STR_TYPE3=3
./maxBoundRun.sh $CFG_FILE2 $ENC_CFG_FILE2 $YUV_FILE2 $GOP_STR_TYPE3

#This will produce summary files containing 5 Qps- Rename them for excel sheet

# Rename the summary files to avoid overwriting
mv summaryTotal.txt "SumTot_"$YUV_FILE2"_"$GOP_STR_TYPE3.txt
mv summary_I.txt "SumI_"$YUV_FILE2"_"$GOP_STR_TYPE3.txt
mv summary_P.txt "SumP_"$YUV_FILE2"_"$GOP_STR_TYPE3.txt
mv summary_B.txt "SumB_"$YUV_FILE2"_"$GOP_STR_TYPE3.txt

echo "Done with Case 3 for" $YUV_FILE2 " sequence"

# End Comment
#END

fi
fi
fi

fi
fi
fi


########### Sequence 2######################

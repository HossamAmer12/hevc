#./TAppEncoder -c cfg/encoder_lowdelay_main.cfg -c cfg/per-sequence/BasketballDrill.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/BasketballDrill_832x480_50.yuv -f 2 -q 30 -b Gen/test1.265 > Gen/test.txt

#./TAppEncoder -c cfg/encoder_case2.cfg -c cfg/per-sequence/BasketballDrill.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/BasketballDrill_832x480_50.yuv -f 2 -q 30 -b Gen/test1.265 > Gen/test.txt


# No spaces are allowed :)
#TS_SOURCE="/Users/hossam.amer/7\@S7\@S\ Works/work/workspace/TS"
#export PATH=GEN/TS:$PATH
#TS_SOURCE= $PATH

# Set the configuration filename
CFG_FILE=BQSquareTest

#CFG_FILE=kpart3

#CFG_FILE=KimonoTest

#CFG_FILE=RB

#CFG_FILE=bunny_downSampledP

#CFG_FILE=RaceBallBQBubbles

#CFG_FILE=elephantNew


#CFG_FILE=KimonoTest

#CFG_FILE=luvTom

#CFG_FILE=luvTomMore


#CFG_FILE=elephant
#CFG_FILE=BasketballDrill
#CFG_FILE=BQMall

CFG_FILE=BasketballPass

# Set the input YUV filename
YUV_FILE=BQSquareTest

YUV_FILE=BasketballPass_416x240_50

#YUV_FILE=kpart3

#YUV_FILE=KimonoTest

#YUV_FILE=RB

#YUV_FILE=bunny_downSampledP

#YUV_FILE=RaceBallBQBubbles

# YUV_FILE=elephantNew


#YUV_FILE=luvTom

#YUV_FILE=luvTomMore


current_mode=$1

#YUV_FILE=Keiba_416x240_30
#YUV_FILE=elephant
#YUV_FILE=BasketballDrill_832x480_50
#YUV_FILE=BQMall_832x480_60

CFG_FILE2="encoder_1"

# Get the number frames
#echo “Please enter the number of frames to encode”
#read -e noFrames

#noFrames=60


#noFrames=34 #for kpart3

#noFrames=5 # for KimonoTest

#noFrames=75 # for ElephantTest

## run for 10 frames to compare
#noFrames=75
#

#noFrames=10 # for BunnyDownSampled

#noFrames=10 # for BunnyDownSampled

noFrames=130


#noFrames=40

noFrames=70


noFrames=40


# ghada
noFrames=23


# Get the Quantization parameter
#echo “Please enter Qp”
#read -e Qp

if [ "$current_mode" == 22 ] ; then
Qp=22
TXT=BD22
BS=BD22
else
Qp=42
TXT=BD42
BS=BD42
#Qp=32
#TXT=BD32
fi

TXT=BD$current_mode
echo 'Output text:' $TXT

#Qp=22
#Qp=42


# Get the BS file output name
#echo “Please enter the bitstream output filename without extention”
#read -e BS

#BS=RB22
#BS=RB42


# Get the Text file output name
#echo “Please enter the text output filename without extention”
#read -e TXT

#TXT=RB22
#TXT=RB42

#sequences_dir=$HOME/"7aS7aS_Works/work/workspace/TS"
sequences_dir="/Users/hossam.amer/Desktop/Projects/TS"

# Run the Encoder
#With text file
# With some Intra and the rest are Bes... encoder GOP size is static
#./TAppEncoder -c cfg/encoder_lowdelay_main.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/$YUV_FILE.yuv -f $noFrames -q $Qp -b Gen/$BS.265 > Gen/$TXT.txt

#./TAppEncoder -c cfg/encoder_lowdelay_main.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i "$sequences_dir"/$YUV_FILE.yuv -f $noFrames -q $Qp -b Gen/$BS.265 > Gen/$TXT.txt

# Run all
# Full Test
#./TAppEncoder -c cfg/$CFG_FILE2.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i "$sequences_dir"/$YUV_FILE.yuv -q $Qp -b Gen/Seq-265/$BS.265 > Gen/Seq-TXT/$TXT.txt

Qp=$current_mode
echo $Qp
## Mock Test
./TAppEncoder -c cfg/$CFG_FILE2.cfg -c cfg/per-sequence/$CFG_FILE.cfg -f $noFrames -i "$sequences_dir"/$YUV_FILE.yuv -q $Qp -b Gen/Seq-265/$BS.265 > Gen/Seq-TXT/$TXT.txt

# Mock Test with sk
#./TAppEncoder -c cfg/$CFG_FILE2.cfg -c cfg/per-sequence/$CFG_FILE.cfg -f $noFrames -sk $Qp -i "$sequences_dir"/$YUV_FILE.yuv -q $Qp -b Gen/Seq-265/$BS.265 > Gen/Seq-TXT/$TXT.txt


# With all Intra
#./TAppEncoder -c cfg/encoder_intra_main.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/$YUV_FILE.yuv -f $noFrames -q $Qp -b Gen/$BS.265 > Gen/$TXT.txt

# With CRA
#./TAppEncoder -c cfg/encoder_randomaccess_main.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/$YUV_FILE.yuv -f $noFrames -q $Qp -b Gen/$BS.265 > Gen/$TXT.txt



#Without text file
#./TAppEncoder -c cfg/encoder_lowdelay_main.cfg -c cfg/per-sequence/$CFG_FILE.cfg -i ~/7\@S7\@S\ Works/work/workspace/TS/$YUV_FILE.yuv -f $noFrames -q $Qp -b Gen/$BS.265

#./TAppEncoder -c cfg/encoder_lowdelay_main.cfg -c cfg/per-sequence/BasketballDrill.cfg -i $PATH/BasketballDrill_832x480_50.yuv -f $noFrames -q $Qp -b Gen/$BS.265 > Gen/$TXT.txt

#T1="foo"
#T2="bar"
#if [ "$T1" = "$T2" ]; then
#echo expression evaluated as true
#else
#echo expression evaluated as false
#fi

echo 'Done!'

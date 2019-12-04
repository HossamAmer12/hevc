
#./TAppDecoder -b Gen/test1.265 -o Gen/dec.yuv


# Set the Reconstructed file name
INPUT=$1

# Set the Reconstructed file name
RECONS=$2

# Run the decoder
./TAppDecoder -b Gen/Seq-265/$INPUT.265 -o Gen/Seq-RECONS/$RECONS.yuv


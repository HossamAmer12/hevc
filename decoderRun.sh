
#./TAppDecoder -b Gen/test1.265 -o Gen/dec.yuv


# Get the Reconstructed file name
echo “Please enter the input BS filename without extension””
read -e INPUT

# Get the Reconstructed file name
echo “Please enter the reconstructed filename without extension”
read -e RECONS

# Run the decoder
#./TAppDecoder -b Gen/$INPUT.265 -o Gen/$RECONS.yuv
./TAppDecoder -b Gen/Seq-265/$INPUT.265 -o Gen/Seq-RECONS/$RECONS.yuv


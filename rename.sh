for file in rPOC-*
do
    # file and pattern and then replacement
    mv -i "${file}" "${file/.txt/.txt.cf}"
done

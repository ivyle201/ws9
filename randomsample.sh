input_percentage=$1
fileInput=$2

if [ -z "$input_percentage" ] || [ -z "$fileInput" ]; then
	echo Parameters are missing;
	exit 1;

elif [ "$input_percentage" -le 0 ] || [ "$input_percentage" -ge 100 ]; then
	echo Integer has to be greater than 0 and less then 100
	exit 1;
fi

fileInputLength=`wc -l $fileInput | awk '{print $1}'`


linecount=`expr $input_percentage \* $fileInputLength / 100`

shuf -n $linecount $2

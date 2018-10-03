# Usage: bash exercise5.sh fileName.csv

# This part of the script will cat the info from the csv file, cut the first two fields
# of a csv, then it will turn the commas to spaces, then only unique results are 
# returned by sorting and using uniq, hten teh unique results are put in a file 

cat $1 | cut -d , -f 1,2 | tr "," " " | sort | uniq > wagesSorted.txt


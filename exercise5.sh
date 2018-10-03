# Usage: bash exercise5.sh fileName.csv

# Part 1
# This part of the script will cat the info from the csv file, cut the first two
# fields of a csv, then it will turn the commas to spaces, then only unique results
# are returned by sorting and using uniq, then the unique results are put in a file 

cat $1 | cut -d , -f 1,2 | tr "," " " | sort | uniq > wagesSorted.txt

# This line should reverse sort the lines by wage, returning the person with the
# highest wage to stdout

echo "Highest Earner"
cat $1 | sort -r -n -k 4 -t , | head -n 1

# This line should sort the lines by wage and return the person with the lowest wage
# to stdout (plus the column names)

echo "Lowest Earner"
cat $1 | sort -n -k 4 -t , | head -n 2


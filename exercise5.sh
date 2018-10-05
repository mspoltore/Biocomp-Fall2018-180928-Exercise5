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

# This line should sort the file by highest earners, , head returns the top ten 
# earners, grep female returns only the female lines and wc -l tells you how many 
# females are in top ten earners

echo "Number of Women in Top 10 of Wages"
cat wages.csv | sort -r -n -k 4 -t , | head -n 10 | grep female | wc -l

#Return one more piece of information to stdout:
# the effect of graduating college (12 vs. 16 years of school) on the minimum wage for earners in this dataset.
# Hint: you can define a shell variable with a numeric variable
# and then use the command bc (“An arbitrary precision calculator language”). 
#If you’ve defined two shell variables (val1 and val2) that are decimal values
# you can subtract them with the following code: echo "$val1 - $val2" | bc

for variable in {12, 16} 
do 
cat $1 | cut -n -d, -f 3,4 | grep var$variable | echo "var16 - var12" | bc 
done 


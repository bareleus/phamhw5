#!/bin/bash

#subtractMachine.sh takes 2 arguments
#Example invocation: ./subtractMachine.sh 3 8

# If the first argument is greater than the second argument
if [ $1 -gt $2 ]
then
   echo
   echo $1 "is larger than" $2 # Echo the output
   diff=$(($1 - $2))
   echo "Difference =" $diff # Perform calculation

# If the 2nd argument is greater than the 1st argument
elif [ $2 -gt $1 ]
then
   echo
   echo $2 "is greater than" $1 # Print output
   diff=$(($2 - $1))
   echo "Difference =" $diff # Calculation

# Otherwise
else
   echo
   echo $1 "is equal to" $2 # When both arguments are equal
   diff=$(($1 - $2))
   echo "Difference =" $diff
fi

# Loop to counter
echo
count=0
while [ $diff -gt $count ]
do
   echo "Count Down =" $diff
   ((diff--))
done

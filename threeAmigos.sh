#!/bin/bash

# threeAmigos.sh takes 4 arguments
# Example invocation: ./threeAmigos.sh 5 5 5 4

# Calculate sum of 1st three arguments
sum=$(($1 + $2 + $3))
# Print out sum
echo
echo "Sum =" $sum

# Executes subtractMachine.sh and the 4th argument
./subtractMachine.sh $sum $4


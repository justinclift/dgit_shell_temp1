#!/usr/bin/env bash

# Super simple tests for mcount.sh

OUTPUT_LINE1="Number of words starting with case-insensitive 'm': "
OUTPUT_LINE2="Number of words longer than 5 characters: "

# Test words
TESTS="MOOSES AREN'T GOOSES... or GEESE for that matter"
EXPECTED="2 4"

# Run the tests as command line input
OUTPUT=`./mcount.sh ${TESTS} | sed "s/${OUTPUT_LINE1}//" | sed "s/${OUTPUT_LINE2}//"`
#echo $OUTPUT

# Remove any linebreaks (seems necessary)
CLEAN=`echo $OUTPUT`

# Check if the output matched the expected result
if [ "${CLEAN}" = "${EXPECTED}" ]; then
  echo Command line testing passed
else
  echo Command line testing failed
fi

# Run the tests as pipe input

# Test with no input

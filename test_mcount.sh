#!/usr/bin/env bash

# Super simple testing for mcount.sh

# There are tonnes of potential improvements, like adding more
# test cases, showing the failing tests, etc.  But that's an
# exercise for another day.

OUTPUT_LINE1="Number of words starting with case-insensitive 'm': "
OUTPUT_LINE2="Number of words longer than 5 characters: "

# Test words
TEST="MOOSES AREN'T GOOSES... or GEESE for that matter"
EXPECTED="2 4"

# Set some initial variable(s)
FAILED=0
OUTPUT=""
THISFAIL=0

# Function to check if the test output matches the expected result
function check_result {
  # Remove any linebreaks (seems necessary)
  CLEAN=`echo $OUTPUT`

  # Check if the output matched the expected result
  THISFAIL=0
  if [ "${CLEAN}" != "${EXPECTED}" ]; then
    THISFAIL=1
  fi
}

# Run the tests as command line input
OUTPUT=`./mcount.sh ${TEST} | sed "s/${OUTPUT_LINE1}//" | sed "s/${OUTPUT_LINE2}//"`
check_result
if [ ${THISFAIL} -eq 0 ]; then
  echo Command line testing passed
else
  echo Command line testing failed
  FAILED=1
fi

# Run the tests as pipe input
OUTPUT=`echo ${TEST} | ./mcount.sh | sed "s/${OUTPUT_LINE1}//" | sed "s/${OUTPUT_LINE2}//"`
check_result
if [ ${THISFAIL} -eq 0 ]; then
  echo Pipe testing passed
else
  echo Pipe testing failed
  FAILED=1
fi

# Test with no input
OUTPUT=`./mcount.sh | sed "s/${OUTPUT_LINE1}//" | sed "s/${OUTPUT_LINE2}//"`
EXPECTED="0 0"
check_result
if [ ${THISFAIL} -eq 0 ]; then
  echo Empty input testing passed
else
  echo Empty input testing failed
  FAILED=1
fi

# Display the final result
if [ $FAILED -eq 0 ]; then
  echo All tests passed
else
  echo Some tests failed

  # Return a non-zero exit status, so this can be called from other scripts
  exit 1
fi

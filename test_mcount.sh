#!/usr/bin/env bash

# Super simple testing for mcount.sh

# There are tonnes of potential improvements, like adding more
# test cases, showing the failing tests, etc.  But that's an
# exercise for another day.

# Test text input
TEST="MOOSES AREN'T GOOSES... or GEESE for that matter"
M_EXPECTED="2"
L_EXPECTED="4"

# Set some initial variable(s)
FAILED=0
OUTPUT=""
THISFAIL=0

# Function to check if the test output matches the expected result
function check_result {
  # Check if the output matched the expected result
  THISFAIL=0
  if [ "${OUTPUT}" != "${EXPECTED}" ]; then
    THISFAIL=1
  fi
}

## Run the tests as command line input

# M word count mode
OUTPUT=`./mcount.sh -m ${TEST}`
EXPECTED=${M_EXPECTED}
check_result
if [ ${THISFAIL} -eq 0 ]; then
  echo Command line testing of m-word count mode passed
else
  echo Command line testing of m-word count mode failed
  FAILED=1
fi

# Long word count mode
OUTPUT=`./mcount.sh -l ${TEST}`
EXPECTED=${L_EXPECTED}
check_result
if [ ${THISFAIL} -eq 0 ]; then
  echo Command line testing of long word count mode passed
else
  echo Command line testing of long word count mode failed
  FAILED=1
fi


## Run the tests as pipe input

# M word count mode
OUTPUT=`echo ${TEST} | ./mcount.sh -m`
EXPECTED=${M_EXPECTED}
check_result
if [ ${THISFAIL} -eq 0 ]; then
  echo Pipe testing of m-word count mode passed
else
  echo Pipe testing of m-word count mode failed
  FAILED=1
fi

# Long word count mode
OUTPUT=`echo ${TEST} | ./mcount.sh -l`
EXPECTED=${L_EXPECTED}
check_result
if [ ${THISFAIL} -eq 0 ]; then
  echo Pipe testing of long word count mode passed
else
  echo Pipe testing of long word count mode failed
  FAILED=1
fi


## Test with no input

# M word count mode
OUTPUT=`./mcount.sh -m`
EXPECTED="0"
check_result
if [ ${THISFAIL} -eq 0 ]; then
  echo Empty input testing of m-word count mode passed
else
  echo Empty input testing of m-word count mode failed
  FAILED=1
fi

# Long word count mode
OUTPUT=`./mcount.sh -l`
EXPECTED="0"
check_result
if [ ${THISFAIL} -eq 0 ]; then
  echo Empty input testing of long word count mode passed
else
  echo Empty input testing of long word count mode failed
  FAILED=1
fi


## Display the final result
if [ $FAILED -eq 0 ]; then
  echo ALL TESTS PASSED
else
  echo SOME TESTS FAILED

  # Return a non-zero exit status, so this can be called from other scripts
  exit 1
fi

#!/usr/bin/env bash

# Processes text input returning the number of words start with "M" or "m",
# and the count of all words longer than 5 chars.

# Set some initial variables
NUM_MWORDS=0
NUM_LONGWORDS=0

# Debugging stuff
#echo $@
#echo $#

# Grab the input words
if [ $# -gt 0 ]; then
  # Grab the input words from the command line
  WORDS=$@
else
  # Debugging stuff
  # echo "No input given via command line"

  # No command line input was given, so try reading from a pipe
  read WORDS
fi

# Test words
#WORDS="MOOSES AREN'T GOOSES... or GEESE for that matter"

# Exit early if no input was given
if [ -z "WORDS" ]; then
  # TODO: Maybe move the count reporting to a function and call it from here
  echo "No input given"
  exit
fi

# Loop around, processing all of the input words
for WORD in $WORDS
do

  # Debugging stuff
  #echo $WORD

  # Retrieve the first character in a word
  FIRST_CHAR=`echo ${WORD} | cut -b 1`

  # Check if the word started with an 'm'
  if [ $FIRST_CHAR = "m" ]; then
    let "NUM_MWORDS++"
  elif [ $FIRST_CHAR = "M" ]; then
    let "NUM_MWORDS++"
  fi

  # Count the number of characters in the word
  WORD_LEN=`echo ${WORD} | wc -c`
  let "WORD_LEN--"

  # If the word was longer than 5 characters, add it to the word count total
  if [ $WORD_LEN -gt 5 ]; then
    let "NUM_LONGWORDS++"
  fi

done

# Display the final word count
echo "Number of words starting with case-insensitive 'm': ${NUM_MWORDS}"
echo "Number of words longer than 5 characters: ${NUM_LONGWORDS}"

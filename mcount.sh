#!/usr/bin/env bash

# Processes text input, returning the number of words starting with
# "M" or "m", and the count of all words longer than 5 characters.

# Set some initial variables
NUM_MWORDS=0
NUM_LONGWORDS=0
WORDS=

# If the input is a pipe, grab the words from that
if [ -p /dev/stdin ]; then
  WORDS=$(cat -)
else
  # Not given a pipe, so check for input on the command line
  if [ $# -gt 0 ]; then
    WORDS=$@
  fi
fi

# Loop around, processing all of the input words
for WORD in $WORDS
do
  # Retrieve the first character in the word
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

  # If the word was longer than 5 characters, add it to the long word count total
  if [ $WORD_LEN -gt 5 ]; then
    let "NUM_LONGWORDS++"
  fi
done

# Display the final word count totals
echo "Number of words starting with case-insensitive 'm': ${NUM_MWORDS}"
echo "Number of words longer than 5 characters: ${NUM_LONGWORDS}"

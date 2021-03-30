#!/usr/bin/env bash

# Processes text input, returning the number of words starting with
# "M" or "m", or the count of all words longer than 5 characters.

# Set some initial variables
COUNT=0
WORDS=

# Grab any mode switch command line options
getopts ":ml" MODE

# TODO: Add help text

# If an unknown option was given, default to counting m words
if [ "$MODE" = "?" ]; then
  MODE=m
fi

# If the input is a pipe, grab the words from that
if [ -p /dev/stdin ]; then
  WORDS=$(cat -)
elif [ $# -gt 0 ]; then
  # Not given a pipe, so check for input on the command line
  WORDS=$@
fi

# Loop around, processing all of the input words
for WORD in $WORDS
do
  # Check for m word counting mode
  if [ "$MODE" = "m" ]; then
    # Retrieve the first character in the word
    FIRST_CHAR=`echo ${WORD} | cut -b 1`

    # Check if the word started with an 'm'
    if [ $FIRST_CHAR = "m" ]; then
      let "COUNT++"
    elif [ $FIRST_CHAR = "M" ]; then
      let "COUNT++"
    fi

  # Check for long word counting mode
  elif [ "$MODE" = "l" ]; then
    # Count the number of characters in the word
    WORD_LEN=`echo ${WORD} | wc -c`
    let "WORD_LEN--"

    # If the word was longer than 5 characters, add it to the long word count total
    if [ $WORD_LEN -gt 5 ]; then
      let "COUNT++"
    fi
  fi
done

# Display the final count total
echo "${COUNT}"

#!/usr/bin/env bash

# Processes text input returning the number of words start with "M" or "m",
# and the count of all words longer than 5 chars.

# Set some initial variables
NUM_MWORDS=0
NUM_LONGWORDS=0

# Debugging stuff
echo $@

# Test words
WORDS="MOOSES AREN'T GOOSES... or GEESE for that matter"

#for WORD in $@

for WORD in $WORDS
do

  # Debugging stuff
  echo $WORD

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

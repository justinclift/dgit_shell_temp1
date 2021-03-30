## Simple scripting test

### Requirements

```
Write a script to process text input and return one of the following depending on arguments:
The NUMBER of words that start with "M" or "m".
Count All the words longer than 5 characters.
---

HINTS
Any scripting language is suitable. Python or Bash is preferred.
Scripts are often combined to form pipelines; don't assume that input might come only from a file.
Make sure you implement this test like you would all your production code. Other candidates might want to extend it one day!
```

### Files present

* mcount.sh - This is the script.  Runs fine when given arguments via command line or shell pipe.
* test_mcount.sh - Super simple test harness for the above mcount.sh script.  Could do with more test cases. ;)
* test_input.txt - Example test case.  Can be used via `cat test_input.txt | ./mcount.sh`

NOTE - I'm going to assume ASCII character input for this (KISS), as I'm not
(yet) sure how bash handles unicode outside of the ascii range (eg multiple
bytes per code point).

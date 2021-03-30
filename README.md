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

Initial thinking is that this sounds pretty simple.  Not sure if it's worth
adding a test suite (prob wouldn't hurt), but we'll see.

If it turns out to have unexpected/weird edge cases, then a test suite
might actually not over-complicate things. :)

NOTE - Going to assume ASCII character input for this (KISS), as I'm not
(yet) sure how bash handles unicode outside of the ascii range (eg multiple
bytes per code point).

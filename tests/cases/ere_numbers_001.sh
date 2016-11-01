#! /bin/sh

# Test case: test if a provided PCRE correctly recognises integer and
# real (floating-point) numbers.

grep -E "^$(grep -vE '^#|^ *$' numbers.ere)\$" tests/inputs/numbers.lst

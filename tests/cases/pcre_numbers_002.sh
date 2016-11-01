#! /bin/sh

# Test case: test if a provided PCRE correctly recognises integer and
# real (floating-point) numbers.

grep -P "^$(grep -vE '^#|^ *$' numbers.pcre)\$" tests/inputs/integers.lst

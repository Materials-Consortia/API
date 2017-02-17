#! /bin/sh

# Test case: test if a provided ERE correctly recognises integer and
# real (floating-point) numbers.

grep -vE "^$(grep -vE '^#|^ *$' grammars/numbers.ere)\$" tests/inputs/not-numbers.lst

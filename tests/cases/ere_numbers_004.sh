#! /bin/sh

# Test case: test if a provided ERE correctly recognises integer and
# real (floating-point) numbers.

grep -E "^$(grep -vE '^#|^ *$' grammars/numbers.ere)\$" tests/inputs/not-numbers.lst

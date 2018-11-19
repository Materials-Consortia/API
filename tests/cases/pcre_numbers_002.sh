#! /bin/sh

# Test case: test if a provided PCRE correctly recognises integer and
# real (floating-point) numbers.

#grep -P "^$(grep -vE '^#|^ *$' grammars/numbers.pcre)\$" tests/inputs/integers.lst
perl -ne "print if /^$(grep -vE '^#|^ *$' grammars/numbers.pcre)\$/" tests/inputs/integers.lst

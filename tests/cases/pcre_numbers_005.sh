#! /bin/sh

# Test case: test if a provided PCRE correctly recognises integer and
# real (floating-point) numbers.

#grep -vP "^$(grep -vE '^#|^ *$' grammars/numbers.pcre)\$" tests/inputs/not-numbers.lst
perl -ne "print unless /^$(grep -vE '^#|^ *$' grammars/numbers.pcre)\$/" tests/inputs/not-numbers.lst

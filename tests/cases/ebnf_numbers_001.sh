#! /bin/bash

# Test case: test if a provided EBNF grammar correctly recognises
# integer and real (floating-point) numbers.

./tools/grammatiker/BNF/scripts/grammatica-tree \
    <(./tools/grammatiker/EBNF/scripts/ebnf2grammatica grammars/numbers.ebnf) \
    <(echo -n 1234)

#! /bin/bash

# Test case: test if a provided Filter langauge EBNF grammar correctly
# recognises filter expressions

./tools/grammatiker/BNF/scripts/grammatica-tree \
    <(./tools/grammatiker/EBNF/scripts/ebnf2grammatica grammars/filters.ebnf) \
    <(echo -n filter='a > b AND (a > 0 OR b > 0)')

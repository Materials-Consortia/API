#! /bin/bash

# Test case: test if a provided Filter langauge EBNF grammar correctly
# recognises filter expressions

./tools/grammatiker/BNF/scripts/grammatica-tree \
    <(./tools/grammatiker/EBNF/scripts/ebnf2grammatica grammars/flat-filters.ebnf) \
    <(echo -n filter='a>1 AND (b<10 OR c!=b OR x>100)')

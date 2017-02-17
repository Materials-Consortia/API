#! /bin/bash

# Test case: test if a provided Filter langauge EBNF grammar correctly
# recognises filter expressions

./tools/grammatiker/BNF/scripts/grammatica-tree \
    <(./tools/grammatiker/EBNF/scripts/ebnf2grammatica grammars/filters.ebnf) \
    <(echo -n filter='b="kva" AND (1<s OR NOT( x!=y AND z>0 ) )')

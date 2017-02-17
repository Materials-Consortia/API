#! /bin/bash

# Test case: test if a provided Filter langauge EBNF grammar correctly
# recognises filter expressions

#BEGIN DEPEND -----------------------------------------------------------------

INPUT_GRAMAR=grammars/flat-filters.ebnf

#END DEPEND -------------------------------------------------------------------

./tools/grammatiker/BNF/scripts/grammatica-tree \
    <(./tools/grammatiker/EBNF/scripts/ebnf2grammatica ${INPUT_GRAMAR}) \
    <(echo -n filter='b="kva" AND (1<s OR NOT( x!=y AND z>0 ) )')

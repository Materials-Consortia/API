#! /bin/bash

# Test case: test if a provided Filter langauge EBNF grammar correctly
# recognises filter expressions

#BEGIN DEPEND -----------------------------------------------------------------

INPUT_GRAMAR=grammars/flat-filters.ebnf

#END DEPEND -------------------------------------------------------------------

./tools/grammatiker/BNF/scripts/grammatica-tree \
    <(./tools/grammatiker/EBNF/scripts/ebnf2grammatica ${INPUT_GRAMAR}) \
    <(echo -n filter='a>1 AND (b<10 OR c!=b OR x>100)')

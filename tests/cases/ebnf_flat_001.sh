#! /bin/bash

# Test case: test if a provided Filter langauge EBNF grammar correctly
# recognises filter expressions

#BEGIN DEPEND -----------------------------------------------------------------

INPUT_GRAMMAR=grammars/flat-filters.ebnf

#END DEPEND -------------------------------------------------------------------

./tools/grammatiker/BNF/scripts/grammatica-tree \
    <(./tools/grammatiker/EBNF/scripts/ebnf2grammatica ${INPUT_GRAMMAR}) \
    <(echo -n filter=a=1)

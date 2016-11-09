#! /bin/bash

# Test case: test if a provided Filter langauge EBNF grammar correctly
# recognises filter expressions

./tools/grammatiker/BNF/scripts/grammatica-tree \
    <(./tools/grammatiker/EBNF/scripts/ebnf2grammatica grammars/flat-filters.ebnf) \
    <(echo -n filter='aax <= +.1e8 OR c21 >= "Sąžininga žąsis" AND NOT ( x != "Some \\ \"string\"" )')

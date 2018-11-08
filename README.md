# OPTiMaDe API tools

This repository contains useful tools for the implementation and
validation of [OPTiMaDe REST APIs](https://www.optimade.org/):

 * a grammar of the Optimade filter language
 * tests for the filter grammar
 * JSON schemata for validation of Optimade responses
 * tests for the JSON schemata

See the [OPTiMaDe specification](https://github.com/Materials-Consortia/OPTiMaDe)
for details.


## JSON validation

**Prerequisites:** A GNU/Linux system with

 * GNU Make
 * Bourne shell
 * GNU textutils
 * perl with JSON module  
   `sudo cpan JSON JSON::Validator`

**Validation:**
```
tools/json-validator schemata/schema.json tests/inputs/cod_query_001.json
```

### JSON validation using python

**Prerequisites:**
```
pip install jsonschema
```

**Validation:**
```
python -m unittest discover
# See tests/test_schemata.py
```

**Note:** `jsonschema` also provides a command line script for validation (`jsonschema -i response.json schema.json`)
but as of November 2018 this does not resolve references like `"$ref": file.json` by default (thus the need to go through python scripts).

## Tests

**Prerequisites:** A GNU/Linux system with

 * GNU Make
 * Bourne shell
 * GNU textutils
 * perl with JSON module  
   `sudo cpan JSON JSON::Validator`

```
make tests
```


## Tasks to be completed

1. Module with functions to parse the url and provide a list of variables
2. Module with functions which for a given set of varibles provide a resonse to the query as specified in OPTiMaDe.

These modules should be designed to be included into a Python script belonging to the databases or decentralized authority. It is the responsibility for each entity to match the given variables with their database.

**S.G. 2016-11-01:**
As I started to describe the token syntax for the filter language in the documents quoted above, I realised that a formal platform-independent definition would be handy. I have thus described a suggested real number syntax as Extended and Perl-Compatible regular expressions, and added several tests to make sure that these expressions perform as expected. The tests/inputs/*.lst files contain a list of real numbers, with some marginal cases, against which each independent implementation and the defining regular expressions can be tested.

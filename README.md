Documentation
=============

Notes can be found in the two google docs:

* https://docs.google.com/document/d/1wvOkuA8OAYWFhO2ObW_IfUNEDKLL1lfP53Gd7txOnME/edit#heading=h.kpoj5jgdcpmr
* https://docs.google.com/document/d/1BbIfJ1fhPrsxQbZ8hdYZCJoMNF2BcbYGtzgiPAS6pt4/edit#

Once agreed upon these should be provided within this project.

Tasks to be completed
=====================

1. Module with functions to parse the url and provide a list of variables
2. Module with functions which for a given set of varibles provide a resonse to the query as specified in the google docs.

These modules should be designed to be included into a Python script belonging to the databases or decentralized authority. It is the responsibility for each entity to match the given variables with their database.

**S.G. 2016-11-01:**
As I started to describe the token syntax for the filter language in the documents quoted above, I realised that a formal platform-independent definition would be handy. I have thus described a suggested real number syntax as Extended and Perl-Compatible regular expressions, and added several tests to make sure that these expressions perform as expected. The tests/inputs/*.lst files contain a list of real numbers, with some marginal cases, against which each independent implementation and the defining regular expressions can be tested.

Tests
=====

The tests should run on any GNU/Linux system with GNU Make, Bourn shell, GNU textutils and Python package [jsonschema](https://python-jsonschema.readthedocs.io/en/latest/) installed:

```
make tests
```

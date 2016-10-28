# Request Examples

**DANGER! ACHTUNG!**
THIS IS NOT ACTUAL SPEC, THIS IS A STRAWMAN.
THIS SHOULD BE MODIFIED PER FINAL WORKSHOP SPEC.

The goal of this document is to show how totranslate use cases into specific API calls.


## "Give me all records."
1. Request:

  ```
  curl http://db.org/minapi/v1/<TBD>
  ```

2. Responses:
  1. Case: has records:

    ```
    {
      <TBD>
    }
    ```

  2. Case: does not have records:

    ```
    {
        "records": {
            "total": 0,
            "records": []
        }
    }
    ```
<hr>

### "Give me all structures."
1. Request:

  ```
  curl http://db.org/minapi/v1/<TBD>
  ```

2. Response
  1. Case: Knows what a structure is.

  1. Case: Has structure records:

    ```
    <NOT ACTUAL SPEC, SHOULD BE MODIFIED PER FINAL WORKSHOP SPEC>
    {
      "records": {
        "count": 3023,
        "records": [
          {"type": "db.org:structure", "id": "db.org:structure:Pqasf1"},
          {"type": "db.org:molecule", "id": "db.org:molecule:23Zasf"},
          ...
          {"type": "db.org:structure", "id": "db.org:structure:234Vas"}
        ]
      }
    }
    ```

    2. Case: Does not have structure records:

      ```
      {
          "records": {
              "total": 0,
              "records": []
          }
      }
      ```

    1. Case: Does not know what a structure is:

      ```
      {
          "records": {
              "total": 0,
              "records": []
          }
      }
      ```

## "Give me all molecules."
1. Request:

  ```
  curl http://db.org/api?action=query&entity_type=db.org:molecule
  ```

2. Response: as per structures.

## "Give me records updated after 2016-10-26 05:30."
1. Request:

  ```
  curl http://db.org/api?action=query&q=updated:gt_201610260530
  ```

2. Response:

  1. Case: has matching records:

    ```
    {
      "records": {
        "count": 3023,
        "records": [
          {"type": "db.org:structure", "id": "db.org:structure:Pqasf1"},
          {"type": "db.org:molecule", "id": "db.org:molecule:23Zasf"},
          ...
          {"type": "db.org:structure", "id": "db.org:structure:234Vas"}
        ]
      }
    }
    ```

  2. Case: no matching records:

    ```
    {
      "records": {
        "count": 0,
        "records": []
      }
    }
    ```

## "Give me structures with melting point < 200 and 'Au' in the chemical formula."
1. Request

  ```
  curl http://db.org/api?action=query&q=[entity_type:db.org:structure] [melting_point < 200] [formula_contains:Au]
  ```

2. Response
  1. Case: has matching records:

    ```
    {
      "records": {
        "count": 3023,
        "records": [
          {"type": "db.org:structure", "id": "db.org:structure:Pqasf1"},
          ...
          {"type": "db.org:structure", "id": "db.org:structure:234Vas"}
        ]
      }
    }
    ```

  2. Case: no matching records:

    ```
    {
      "records": {
        "count": 0,
        "records": []
      }
    }
    ```

## "Give me the fields 'field_1' and 'field_2' for all structures."

1. Request:

  ```
  curl http://db.org/api?action=query&q=[entity_type:db.org:structure]&fields=field_1,field_2
  ```

2. Response:
  1. Case: has structures.
    1. Case: DB has all requested fields in its schema.

      ```
      {
        "records": {
          "count": 3023,
          "records": [
            {"type": "db.org:structure", "id": "db.org:structure:Pqasf1",
             "fields": {"field_1": "value_1", "field_2": "value_2"}},
            ...
            {"type": "db.org:structure", "id": "db.org:structure:Pqasf1",
             "fields": {"field_1": "value_1", "field_2": null}},
          ]
        }
      }
      ```

      2. Case: DB only has 'field_1':

        ```
        {
          "records": {
            "count": 3023,
            "records": [
              {"type": "db.org:structure", "id": "db.org:structure:Pqasf1",
               "fields": {"field_1": "value_1", "field_2": null}},
              ...
              {"type": "db.org:structure", "id": "db.org:structure:Pqasf1",
               "fields": {"field_1": "value_1", "field_2": null}},
            ]
          }
        }
        ```
  2. Does not have structures:
    
    ```
    {
      "records": {
        "count": 0,
        "records": []
      }
    }
    ```

## "Give me the version of the API."
1. Request:

  ```
  curl http://db.org/api?action=introspect&fields=api_version
  ```
2. Response:

  ```
  {"api_version": 1.2}
  ```

## "Give me the types of entities you know about."
1. Request:

  ```
  curl http://db.org/api?action=introspect&fields=entity_types
  ```
2. Response:

  ```
  {"entity_types": ['structure', 'molecule', 'db.org:custom_entity_type']}
  ```

## "Give me the structure properties you know about for structures and molecules."
1. Request:

  ```
  curl http://db.org/api?action=introspect&filter=[entity_type:structure,molecule]&fields=properties
  ```
2. Response:

  ```
  {
    "properties": {
      "structure": {
        "properties": [
          {"property_id": "db.org:chemical_formula", "description": ...},
          ...
          {"property_id": "db.org:custom_structure_property", "description": ...}
        ]
      }
      "molecule": {
        {"property_id": "db.org:chemical_formula", "description": ...},
        ...
        {"property_id": "db.org:custom_molecule_property", "description": ...}
      }
    }
  }
  `

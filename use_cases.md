# Request Examples

**DANGER! ACHTUNG!**
THIS IS NOT ACTUAL SPEC, THIS IS A STRAWMAN.
THIS SHOULD BE MODIFIED PER FINAL WORKSHOP SPEC.

The goal of this document is to show how to translate use cases into specific API calls.


## "Give me all records."
1. Request:

  ```
  curl http://example.com/minapi/all/
  ```

2. Responses:
  1. Case: has records:

    ```
    {
      "query": {
        "representation": "/all/",
        "api_version": "v1",
        "time_stamp": "20161028T080851Z"
        "data_returned": "10",
        "data_available": "10",
        "last_id": "molecule:f81d4fae-7dec-11d0-a765-00a0c91e6bf6"
      },
      "data": [
        {
          "type": "structure",
          "properties": { "formula": "Au2", ...},
          "local_id": "struct:abce4fae-7dec-11d0-a765-00a0c91e6bf6",
          "url": "http://example.db/structs/abce4fae-7dec-11d0-a765-00a0c91e6bf6",
          "last_modified": "20151028T080851Z"
        },
        ...
        {
          "type": "molecule",
          "properties": { "InChIKey": "BQJCRHHNABKAKU-KBQPJGBKSA-N", ...},
          "local_id": "molecule:f81d4fae-7dec-11d0-a765-00a0c91e6bf6",
          "url": "http://example.db/molecules/f81d4fae-7dec-11d0-a765-00a0c91e6bf6",
          "last_modified": "20151028T080891Z"
        }
      ]
    }
    ```

  2. Case: does not have records:

    ```
    {
      "query": {
        "representation": "/all/",
        "api_version": "v1",
        "time_stamp": "20161028T080851Z"
        "data_returned": 0,
        "data_available": 0,
        "last_id": null
      },
      "data": []
    }
    ```
<hr>

### "Give me all structures."
1. Request:

  ```
  curl http://example.com/minapi/structures/
  ```

2. Response
  1. Case: Knows what a structure is.

    1. Case: Has structure records:

      ```
      {
        "query": {
          "representation": "/structures/",
          "api_version": "v1",
          "time_stamp": "20161028T080851Z",
          "data_returned": "10",
          "data_available": "10",
          "last_id": "struct:f81d4fae-7dec-11d0-a765-00a0c91e6bf6"
        },
        "data": [
          {
            "type": "structure",
            "properties": { "formula": "Au2", ...},
            "local_id": "struct:abce4fae-7dec-11d0-a765-00a0c91e6bf6",
            "url": "http://example.db/structs/abce4fae-7dec-11d0-a765-00a0c91e6bf6",
            "last_modified": "20161028T080851Z"
          },
          ...
          {
            "type": "structure",
            "properties": { "formula": "Au2", ...},
            "local_id": "struct:f81d4fae-7dec-11d0-a765-00a0c91e6bf6",
            "url": "http://example.db/structs/f81d4fae-7dec-11d0-a765-00a0c91e6bf6",
            "last_modified": "20161028T080891Z"
          }
        ]
      }
      ```

    1. Case: Does not have structure records:

    ```
    {
      "query": {
        "representation": "/structures/",
        "api_version": "v1",
        "time_stamp": "20161028T080851Z"
        "data_returned": 0,
        "data_available": 0,
        "last_id": null,
      },
      "data": []
    }
    ```

  1. Case: Does not implement 'structures' endpoint:

    ```
    <404 Response Code>
    ```

## "Give me all records updated after 2016-10-26 05:30."

**FILTER NEEDS TO BE HARMONIZED TO API SPECIFICATION**

1. Request:

  ```
  curl 'http://example.com/minapi/all/?filter=last_modified:%3E=201501010000'
  ```

2. Response:

  1. Case: has matching records:

    ```
    {
      "query": {
          "representation": "/all/?filter=last_modified:%3E=201501010000",
          "api_version": "v1",
          "time_stamp": "20161028T080851Z"
          "data_returned": "10",
          "data_available": "10",
          "last_id": "molecule:f81d4fae-7dec-11d0-a765-00a0c91e6bf6"
      },
      "data": [
        {
          "type": "structure",
          "properties": { "formula": "Au2", ...},
          "local_id": "struct:abce4fae-7dec-11d0-a765-00a0c91e6bf6",
          "url": "http://example.db/structs/abce4fae-7dec-11d0-a765-00a0c91e6bf6",
          "last_modified": "20151028T080851Z"
        },
        ...
        {
          "type": "molecule",
          "properties": { "InChIKey": "BQJCRHHNABKAKU-KBQPJGBKSA-N", ...},
          "local_id": "molecule:f81d4fae-7dec-11d0-a765-00a0c91e6bf6",
          "url": "http://example.db/molecules/f81d4fae-7dec-11d0-a765-00a0c91e6bf6",
          "last_modified": "20151028T080891Z"
        }
      ]
    }
    ```

  2. Case: no matching records:

    ```
    {
      "query": {
        "representation": "/all/?filter=last_modified:%3E=201501010000",
        "api_version": "v1",
        "time_stamp": "20161028T080851Z"
        "data_returned": 0,
        "data_available": 0,
        "last_id": null
      },
      "data": []
    }
    ```

## "Give me structures with melting point < 200 and 'Au' in the chemical formula."
1. Request

  ```
  curl http://example.com/minapi/structures/?filter=(melting_point:%3C200)%20AND%20(formula:~Au)
  ```

2. Response
  1. Case: has matching records:

    ```
    {
      "query": {
        "representation": "/structures/?filter=(melting_point:%3C200)%20AND%20(formula:~Au)",
        "api_version": "v1",
        "time_stamp": "20161028T080851Z",
        "data_returned": 10,
        "data_available": 10,
        "last_id": "struct:f81d4fae-7dec-11d0-a765-00a0c91e6bf6"
      },
      "data": [
        {
          "type": "structure",
          "properties": { "formula": "Au2", ...},
          "local_id": "struct:abce4fae-7dec-11d0-a765-00a0c91e6bf6",
          "url": "http://example.db/structs/abce4fae-7dec-11d0-a765-00a0c91e6bf6",
          "last_modified": "20161028T080851Z"
        },
        ...
        {
          "type": "structure",
          "properties": { "formula": "Au2", ...},
          "local_id": "struct:f81d4fae-7dec-11d0-a765-00a0c91e6bf6",
          "url": "http://example.db/structs/f81d4fae-7dec-11d0-a765-00a0c91e6bf6",
          "last_modified": "20161028T080891Z"
        }
      ]
    }
    ```

  2. Case: no matching records:

    ```
    {
      "query": {
        "representation": "/all/?filter=last_modified:%3E=201501010000",
        "api_version": "v1",
        "time_stamp": "20161028T080851Z"
        "data_returned": 0,
        "data_available": 0,
        "last_id": null
      },
      "data": []
    }
    ```

## "Give me the fields 'field_1' and 'field_2' for all structures."

1. Request:

  ```
  curl http://example.com/minapi/structures/?fields=field_1,field_2
  ```

2. Response:
  1. Case: has structures.
    1. Case: DB has all requested fields in its schema.

      ```
      {
        "query": {
          "representation": "/structures/?fields=field_1,field_2",
          "api_version": "v1",
          "time_stamp": "20161028T080851Z",
          "data_returned": 10,
          "data_available": 10,
          "last_id": "struct:f81d4fae-7dec-11d0-a765-00a0c91e6bf6"
        },
        "data": [
          {
            "type": "structure",
            "properties": { "field_1": "value1", "field_2": "value2"},
            "local_id": "struct:abce4fae-7dec-11d0-a765-00a0c91e6bf6",
            "url": "http://example.db/structs/abce4fae-7dec-11d0-a765-00a0c91e6bf6",
            "last_modified": "20161028T080851Z"
          },
          ...
          {
            "type": "structure",
            "properties": { "field_1": "value1", "field_2": "value2"},
            "local_id": "struct:f81d4fae-7dec-11d0-a765-00a0c91e6bf6",
            "url": "http://example.db/structs/f81d4fae-7dec-11d0-a765-00a0c91e6bf6",
            "last_modified": "20161028T080891Z"
          }
        ]
      }
      ```

      2. Case: DB only has 'field_1':

        ```
        {
          "query": {
            "representation": "/structures/?fields=field_1,field_2",
            "api_version": "v1",
            "time_stamp": "20161028T080851Z",
            "data_returned": 10,
            "data_available": 10,
            "last_id": "struct:f81d4fae-7dec-11d0-a765-00a0c91e6bf6"
          },
          "data": [
            {
              "type": "structure",
              "properties": { "field_1": "value1", "field_2": null},
              "local_id": "struct:abce4fae-7dec-11d0-a765-00a0c91e6bf6",
              "url": "http://example.db/structs/abce4fae-7dec-11d0-a765-00a0c91e6bf6",
              "last_modified": "20161028T080851Z"
            },
            ...
            {
              "type": "structure",
              "properties": { "field_1": "value1", "field_2": null},
              "local_id": "struct:f81d4fae-7dec-11d0-a765-00a0c91e6bf6",
              "url": "http://example.db/structs/f81d4fae-7dec-11d0-a765-00a0c91e6bf6",
              "last_modified": "20161028T080891Z"
            }
          ]
        }
        ```

  2. Does not have structures:
    
    ```
    {
      "query": {
        "representation": "/structures/?fields=field_1,field_2",
        "api_version": "v1",
        "time_stamp": "20161028T080851Z",
        "data_returned": 0,
        "data_available": 0,
        "last_id": "struct:f81d4fae-7dec-11d0-a765-00a0c91e6bf6"
      },
      "data": []
    }
    ```

## "Give me the version of the API."
1. Request:

  ```
  curl http://example.com/minapi/info/
  ```
2. Response:

  ```
  {
    "api_version": "1.2.1",
    "endpoints": [
      "/all",
      "/info",
      "/structures",
      "/molecules"
    ]
    ...
  }
  ```

## "Give me the endpoints you provide."
1. Request:

  ```
  curl http://example.com/minapi/info/
  ```

2. Response:

  ```
  {
    "api_version": "1.2.1",
    "endpoints": [
      "/all",
      "/info",
      "/structures",
      "/molecules"
    ]
    ...
  }
  ```

## "Give me the info for 'structure' entries.
1. Request:

  ```
  curl http://example.com/minapi/structures/info
  ```
2. Response:

  ```
  ?
  ```

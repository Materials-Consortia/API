import json
import unittest
import jsonschema
from jsonschema.exceptions import ValidationError
import os

test_dir = os.path.dirname(os.path.realpath(__file__))
schema_dir = os.path.join(test_dir, os.path.pardir, 'schemata')

class OptimadeTestCase(unittest.TestCase):
    """Test validation of JSON responses of OPTiMaDe APIs."""

    @classmethod
    def setUpClass(cls):
        schema_path = os.path.join(schema_dir, 'schema.json')
        with open(schema_path) as file_object:
            cls.meta_schema = json.load(file_object)

        # Note: the second parameter does nothing.
        # This resolver is necessary to resolve references like
        #   "$ref": file.json
        # See https://github.com/Julian/jsonschema/issues/98

        cls.resolver = jsonschema.RefResolver('file://' + schema_dir + '/', None)

    def validate(self, data):
        """Validates using custom resolver."""
        return jsonschema.validate(data, self.meta_schema, resolver=self.resolver)

    def load_json(self, fname):
        json_path = os.path.join(test_dir, 'inputs', fname)
        with open(json_path) as file_object:
            data = json.load(file_object)
        return data

    def test_cod_query_001(self):
        data = self.load_json('cod_query_001.json')

        self.validate(data)

    def test_cod_query_002(self):
        data = self.load_json('cod_query_002.json')

        with self.assertRaises(ValidationError):
            self.validate(data)

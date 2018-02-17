# coding: utf-8

from __future__ import absolute_import

from flask import json
from six import BytesIO

from swagger_server.models.keyvaluestore import KEYVALUESTORE  # noqa: E501
from swagger_server.test import BaseTestCase


class TestDefaultController(BaseTestCase):
    """DefaultController integration test stubs"""

    def test_keyvaluestore_get(self):
        """Test case for keyvaluestore_get

        
        """
        response = self.client.open(
            '/api/keyvaluestore',
            method='GET',
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_setkeyvalue_post(self):
        """Test case for setkeyvalue_post

        
        """
        query_string = [('key', 'key_example'),
                        ('value', 'value_example')]
        response = self.client.open(
            '/api/setkeyvalue',
            method='POST',
            content_type='application/json',
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))


if __name__ == '__main__':
    import unittest
    unittest.main()

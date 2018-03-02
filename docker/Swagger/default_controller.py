import connexion
import six

from swagger_server.models.keyvaluestore import KEYVALUESTORE  # noqa: E501
from swagger_server import util
from keyval_stub import get_keyvalstore
from keyval_stub import set_keyvalstore


def keyvaluestore_get():  # noqa: E501
    """keyvaluestore_get

    Returns key value store object # noqa: E501


    :rtype: KEYVALUESTORE
    """
    return KEYVALUESTORE(get_keyvalstore())


def setkeyvalue_post(key, value=None):  # noqa: E501
    """setkeyvalue_post

    Sets the key and its value with the parameters # noqa: E501

    :param key: Key that needs to be stored
    :type key: str
    :param value: Value that needs to be stored for the specific key
    :type value: str

    :rtype: KEYVALUESTORE
    """
    return KEYVALUESTORE(set_keyvalstore(key))

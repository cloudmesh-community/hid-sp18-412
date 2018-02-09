import connexion
import six

from swagger_server.models.user import User  # noqa: E501
from swagger_server import util
from keyval_stub import get_keyvalstore
#from firebase import firebase

def keyvalstore_get():  # noqa: E501
    """keyvalstore_get

    Returns key value store object # noqa: E501


    :rtype: User
    """
    return User(get_keyvalstore())

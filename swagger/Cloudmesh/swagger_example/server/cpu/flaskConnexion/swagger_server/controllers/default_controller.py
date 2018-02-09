import connexion
import six

from swagger_server.models.cpu import CPU  # noqa: E501
from swagger_server import util
from cpu_stub import get_processor_name


def cpu_get():  # noqa: E501
    """cpu_get

    Returns cpu information of the hosting server # noqa: E501


    :rtype: CPU
    """
    return CPU(get_processor_name())
    #return 'do some magic!'

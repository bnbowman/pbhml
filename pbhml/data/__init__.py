__author__ = 'bbowman@pacificbiosciences.com'

from pkg_resources import Requirement, resource_filename

CONEXIO_FILES = ["F3--R3.xml", "F4--R4.xml", "F6--R6.xml", "F7--R7.xml"]

HLA_TOOLS_FILES = ["F3--R3.typing", "F4--R4.typing",
                   "F6--R6.typing", "F7--R7.typing"]

def _get_abs_path(filename):
    return resource_filename(Requirement.parse('pbhml'),
                             'data/{0}'.format(filename))

def _get_conexio_path(filename):
    return _get_abs_path("typings/conexio/{0}".format(filename))

def _get_hla_tools_path(filename):
    return _get_abs_path("typings/hla_tools/{0}".format(filename))

def get_f3_xml():
    return _get_conexio_path(CONEXIO_FILES[0])

def get_f3_txt():
    return _get_hla_tools_path(HLA_TOOLS_FILES[0])
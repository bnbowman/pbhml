__author__ = 'bbowman@pacificbiosciences.com'

class SmrtHmlRecord:
    def __init__(self, name, sequence, type):
        self._name = name
        self._sequence = sequence
        self._type = type
    @property
    def name(self):
        return self._name
    @property
    def sequence(self):
        return self._sequence
    @property
    def type(self):
        return self._type

class SmrtHmlReport:
    """A class for representing a SMRT Analysis HML Report
    """

    def __init__(self, version):
        self._version = version
        self._records = []

    def add_record(self, name, sequence, type):
        record = SmrtHmlRecord(name, sequence, type)
        self._records.append( record )
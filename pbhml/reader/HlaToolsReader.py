__author__ = 'bbowman@pacificbiosciences.com'

from collections import namedtuple

from base import BaseTypingReader

HlaToolsRecord = namedtuple('HlaToolsRecord', 'name glen gtype gpctid nmis indel clen ctype cpctid type')

class HlaToolsReader(BaseTypingReader):
    """
    An abstract base-class to define the interface by which readers for the outputs of different
    reader software will make their contents accessible
    """

    def __init__(self, filename):
        self._filename = filename
        self._records = self._parse_records()
        print self._records

    def _parse_records(self):
        records = []
        with open( self._filename ) as handle:
            handle.next()       # Skip header row
            for line in handle:
                records.append( HlaToolsRecord._make(line.strip().split()) )
        return records

    @property
    def names(self):
        """
        Return the names of the sequences typed in this file
        """
        raise NotImplementedError("This is an abstract class")

    @property
    def loci(self):
        """
        Return the loci of the sequences typed in this file
        """
        raise NotImplementedError("This is an abstract class")

    @property
    def __getitem__(self, item):
        """
        Return the typing associated with a specified sequence name
        """
        raise NotImplementedError("This is an abstract class")

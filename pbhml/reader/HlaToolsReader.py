__author__ = 'bbowman@pacificbiosciences.com'

from collections import namedtuple

from base import BaseTypingReader

def sorted_set(a_list):
    return sorted(list(set(a_list)))

HlaToolsRecord = namedtuple('HlaToolsRecord', 'name glen gtype gpctid nmis indel clen ctype cpctid type')

class HlaToolsReader(BaseTypingReader):
    """
    An abstract base-class to define the interface by which readers for the outputs of different
    reader software will make their contents accessible
    """

    def __init__(self, filename):
        self._filename = filename
        self._records = self._parse_records()
        self._types_by_name = {r.name: r.type for r in self._records}
        self._loci = sorted_set([r.gtype.split('*')[0] for r in self._records])
        print self._records

    def _parse_records(self):
        records = []
        with open( self._filename ) as handle:
            handle.next()       # Skip header row
            for line in handle:
                records.append( HlaToolsRecord._make(line.strip().split()) )
        return sorted(records, key=lambda r: r.name)

    @property
    def records(self):
        """
        Return all of the typing records
        """
        return self._records

    @property
    def names(self):
        """
        Return the names of the sequences typed in this file
        """
        return sorted(self._types_by_name.keys())

    @property
    def types(self):
        return [(r.name, r.type) for r in self._records]

    @property
    def loci(self):
        """
        Return the loci of the sequences typed in this file
        """
        return self._loci

    @property
    def __getitem__(self, item):
        """
        Return the typing associated with a specified sequence name
        """
        return self._types_by_name[item]
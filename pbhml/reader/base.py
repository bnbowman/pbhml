__author__ = 'bbowman@pacificbiosciences.com'

class BaseTypingReader(object):
    """
    An abstract base-class to define the interface by which readers for the outputs of different
    reader software will make their contents accessible
    """

    def __init__(self, filename):
        raise NotImplementedError("This is an abstract class")

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

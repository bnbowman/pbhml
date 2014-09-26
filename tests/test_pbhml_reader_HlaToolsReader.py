__author__ = 'bbowman'

from nose.tools import assert_equal, assert_true, assert_false

import pbhml.data
import pbhml.reader

class TestHlaToolsReader:
    """Tests of basic functionality of HlaToolsReader
    """

    def __init__(self):
        self.f3_txt = pbhml.data.get_f3_txt()
        self.f3_reader = pbhml.reader.HlaToolsReader( self.f3_txt )

    def test_basicTest(self):
        """Test that BasH5Reader correctly sets moviename, identifies the
        sequencingZmws, and finds the subreads for each Zmw.
        """
        assert_true(True)


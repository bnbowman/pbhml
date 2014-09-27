
__author__ = 'bbowman@pacificbiosciences.com'

from nose.tools import assert_equal, assert_true, assert_list_equal

import pbhml.data
import pbhml.job
import pbhml.report

import os

class TestSmrtHmlReportWriter:
    """Tests of basic functionality of HlaToolsReader
    """

    def __init__(self):
        self.split_dir = pbhml.data.get_split_dir()
        self.f3_file = pbhml.data.get_f3_txt()
        self.hml_writer = pbhml.report.SmrtHmlReportWriter(self.f3_file, self.split_dir)

    def test_basicTest(self):
        """Test that HlaToolsReader correctly sets moviename, identifies the
        sequencingZmws, and finds the subreads for each Zmw.
        """
        assert_list_equal(['F3--R3'], self.hml_writer.barcodes)


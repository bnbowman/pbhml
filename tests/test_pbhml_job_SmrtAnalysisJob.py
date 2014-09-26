__author__ = 'bbowman'

from nose.tools import assert_equal, assert_true, assert_list_equal

import pbhml.data
import pbhml.job

import os

class TestSmrtAnalysisJob:
    """Tests of basic functionality of HlaToolsReader
    """

    def __init__(self):
        self.split_dir = pbhml.data.get_split_dir()
        self.split_job = pbhml.job.SmrtAnalysisJob( self.split_dir )

    def test_basicTest(self):
        """Test that HlaToolsReader correctly sets moviename, identifies the
        sequencingZmws, and finds the subreads for each Zmw.
        """
        assert_true(self.split_job.amplicon_analysis_dir.endswith('/pbhml/data/jobs/Split/log/P_AmpliconAnalysis'))
        assert_true(self.split_job.amplicon_analysis_log.endswith('AmpliconAnalysis.log'))
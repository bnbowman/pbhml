__author__ = 'bbowman'

from nose.tools import assert_equal, assert_true, assert_list_equal

import pbhml.data
import pbhml.reader

class TestHlaToolsReader:
    """Tests of basic functionality of HlaToolsReader
    """

    def __init__(self):
        self.f3_txt = pbhml.data.get_f3_txt()
        self.f3_reader = pbhml.reader.HlaToolsReader( self.f3_txt )

    def test_basicTest(self):
        """Test that HlaToolsReader correctly sets moviename, identifies the
        sequencingZmws, and finds the subreads for each Zmw.
        """
        assert_list_equal(['HLA-A', 'HLA-B', 'HLA-C'],
                          self.f3_reader.loci)
        assert_list_equal(['BarcodeF3--R3_Cluster0_Phase0_NumReads386',
                           'BarcodeF3--R3_Cluster1_Phase0_NumReads336',
                           'BarcodeF3--R3_Cluster2_Phase3_NumReads174',
                           'BarcodeF3--R3_Cluster3_Phase1_NumReads195',
                           'BarcodeF3--R3_Cluster4_Phase2_NumReads164',
                           'BarcodeF3--R3_Cluster5_Phase1_NumReads170'],
                           self.f3_reader.names)
        assert_list_equal([('BarcodeF3--R3_Cluster0_Phase0_NumReads386', 'HLA-A*68:01:02'),
                           ('BarcodeF3--R3_Cluster1_Phase0_NumReads336', 'HLA-A*31:01:02'),
                           ('BarcodeF3--R3_Cluster2_Phase3_NumReads174', 'HLA-B*40:01:02'),
                           ('BarcodeF3--R3_Cluster3_Phase1_NumReads195', 'HLA-B*18:01:01:02'),
                           ('BarcodeF3--R3_Cluster4_Phase2_NumReads164', 'HLA-C*03:04:01:01'),
                           ('BarcodeF3--R3_Cluster5_Phase1_NumReads170', 'HLA-C*07:01:01:01')],
                           self.f3_reader.types)
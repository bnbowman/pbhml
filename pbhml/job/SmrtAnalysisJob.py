__author__ = 'bbowman@pacificbiosciences.com'

import os
from pbcore.io import FastqReader
from utils import sample_from_file


class SmrtAnalysisJob:
    """A class for representing a SMRT Analysis Job directory
    """

    def __init__(self, directory):
        self._root_dir = self._test_directory(directory)
        self._log_dir = self._test_directory(os.path.join(self._root_dir, 'log'))
        self._data_dir = self._test_directory(os.path.join(self._root_dir, 'data'))
        self._amplicon_analysis_dir = self._test_directory(os.path.join(self._log_dir, 'P_AmpliconAnalysis'))
        self._amplicon_analysis_log = self._find_aa_log()
        self._sequence_files = self._find_sequence_files()
        self._barcodes = sorted(self._sequence_files.keys())

    def _find_aa_log(self):
        log_files = ['doAmpliconAnalysis.log', 'doBarcodedAmpliconAnalysis.log',
                     'doSplitBarcodeAmpliconAnalysis.log']
        log_paths = [os.path.join(self.amplicon_analysis_dir, l) for l in log_files]
        log_paths = [self._test_filepath(l) for l in log_paths]
        log_path = [l for l in log_paths if l is not None]
        if len(log_path) > 1:
            raise ValueError("More than one valid log file found: {0}".format(log_path))
        elif len(log_path) == 0:
            raise ValueError("No valid log file found!")
        return log_path[0]

    def _find_sequence_files(self):
        if 'amplicon_analysis.fastq' in os.listdir(self._data_dir):
            return {'all': os.path.join(self._data_dir, 'amplicon_analysis.fastq')}
        elif 'amplicon_analysis_fastq' in os.listdir(self._data_dir):
            fastq_dir = os.path.join(self._data_dir, 'amplicon_analysis_fastq')
            filepaths = [os.path.join(fastq_dir, f) for f in os.listdir(fastq_dir)]
            return {sample_from_file(f): f for f in filepaths}
        else:
            raise IOError("No valid sequence files found!")

    @classmethod
    def _test_directory(cls, directory):
        dirpath = os.path.abspath(directory)
        try:
            assert os.path.exists(dirpath)
        except AssertionError:
            raise OSError("Directory '%s' not found".format(directory))
        return dirpath

    @classmethod
    def _test_filepath(cls, filepath):
        try:
            assert os.path.exists(filepath)
        except AssertionError:
            return None
        return filepath

    @property
    def root_dir(self):
        return self._root_dir

    @property
    def log_dir(self):
        return self._log_dir

    @property
    def amplicon_analysis_dir(self):
        return self._amplicon_analysis_dir

    @property
    def amplicon_analysis_log(self):
        return self._amplicon_analysis_log

    @property
    def sequence_files(self):
        return self._sequence_files

    @property
    def barcodes(self):
        return self._barcodes

    def sequence_records(self, barcode):
        assert barcode in self.barcodes
        barcode_file = self.sequence_files[barcode]
        return iter(FastqReader(barcode_file))
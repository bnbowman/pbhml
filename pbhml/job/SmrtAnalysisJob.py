__author__ = 'bbowman@pacificbiosciences.com'

import os

class SmrtAnalysisJob:
    """A class for representing a SMRT Analysis Job directory
    """

    def __init__(self, directory):
        self._root_dir = self._test_directory(directory)
        self._log_dir = self._test_directory(os.path.join(self._root_dir, 'log'))
        self._amplicon_analysis_dir = self._test_directory(os.path.join(self._log_dir, 'P_AmpliconAnalysis'))
        self._amplicon_analysis_log = self._find_aa_log()

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
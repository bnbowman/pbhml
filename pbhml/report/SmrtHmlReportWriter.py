__author__ = 'bbowman@pacificbiosciences.com'

import os

from pbhml.job import SmrtAnalysisJob
from pbhml.reader import HlaToolsReader
from pbhml.report.SmrtHmlReport import SmrtHmlReport

class SmrtHmlReportWriter:
    """A Class for writing multiple HML Reports from SMRT Sequencing data
    """

    def __init__(self, typing, job, output=''):
        self._typing = self._set_typing( typing )
        self._job = self._set_job( job )
        self._output = os.path.abspath(output) if output else os.getcwd()

    def _set_typing(self, typing):
        if isinstance(typing, str):
            try:
                 reader = HlaToolsReader(typing)
            except:
                raise ValueError("Not a recognized HLA Typing result '{0}'".format(typing))
        elif isinstance(typing, HlaToolsReader):
            return typing
        else:
            raise TypeError("Not a recognized HLA Typing result '{0}'".format(typing))
        return reader

    def _set_job(self, job):
        if isinstance(job, str):
            try:
                 reader = SmrtAnalysisJob(job)
            except:
                raise ValueError("Not a recognized SMRT Analysis Job '{0}'".format(job))
        elif isinstance(job, SmrtAnalysisJob):
            return job
        else:
            raise TypeError("Not a recognized SMRT Analysis Job '{0}'".format(job))
        return reader

    @property
    def sequence_barcodes(self):
        return self._job.barcodes

    @property
    def typing_barcodes(self):
        return self._typing.barcodes

    @property
    def barcodes(self):
        return sorted(set(self.sequence_barcodes) & set(self.typing_barcodes))

    def write_report(self, barcode):
        assert barcode in self.barcodes
        report = SmrtHmlReport()
        records = self._job.sequence_records(barcode)
        for record in records:
            name = record.name.strip().split()[0]
            try:
                typing = self._typing[name]
            except:
                continue
            report.add_record(name, record.sequence, typing)
        return str(report)
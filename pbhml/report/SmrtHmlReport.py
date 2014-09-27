__author__ = 'bbowman@pacificbiosciences.com'

from pbhml.job import SmrtAnalysisJob
from pbhml.reader import HlaToolsReader

class SmrtHmlReport:
    """A Class for representing and writing an HML Report from SMRT Sequencing data
    """

    def __init__(self, typing, job):
        self._typing = self._set_typing( typing )
        self._job = self._set_job( job )

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
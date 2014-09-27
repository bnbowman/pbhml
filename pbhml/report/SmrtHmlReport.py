__author__ = 'bbowman@pacificbiosciences.com'

import xml.etree.ElementTree as et
from utils import sorted_set, family_from_typing, locus_from_typing

class SmrtHmlRecord:
    def __init__(self, name, sequence, typing):
        self._name = name
        self._sequence = sequence
        self._typing = typing
        self._family = family_from_typing(typing)
        self._locus = locus_from_typing(typing)

    @property
    def name(self):
        return self._name
    @property
    def sequence(self):
        return self._sequence
    @property
    def typing(self):
        return self._typing
    @property
    def family(self):
        return self._family
    @property
    def locus(self):
        return self._locus

    def __str__(self):
        return '<SmrtHmlRecord: {0}, {1}, {2}>'.format(self.name, self.family, self.locus)

class SmrtHmlReport:
    """A class for representing a SMRT Analysis HML Report
    """

    def __init__(self, center_code="123", id="123456789"):
        self._center_code = center_code
        self._id = id
        self._hml = self._initialize_hml()
        self._sample = self._initialize_sample()
        self._records = []
        self._processed = False

    @staticmethod
    def _initialize_hml():
        # Initialize the root HML report
        hml = et.Element("hml")
        hml.set("xmlns", "http://schemas.nmdp.org/spec/hml/0.9.6")
        hml.set("xmlns:hml", "http://schemas.nmdp.org/spec/hml/0.9.6")
        hml.set("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance")
        hml.set("xsi:schemaLocation",
                "http://schemas.nmdp.org/spec/hml/0.9.6 http://schemas.nmdp.org/spec/hml/0.9.6/hml-0.9.6.xsd")
        hml.set("reporting-center", "789")
        hml.set("project-name", "LAB")
        hml.set("version", "0.9.6")
        return hml

    def _initialize_sample(self):
        # Add the first sample
        sample = et.SubElement(self._hml, "sample")
        sample.set("center-code", self._center_code)
        sample.set("id", self._id)
        return sample

    def add_record(self, name, sequence, typing):
        record = SmrtHmlRecord(name, sequence, typing)
        self._records.append( record )

    def _process_records(self):
        # Iterate over each family, adding a typing tag for each
        for family in self.gene_families:
            typing = et.SubElement(self._sample, "typing")
            typing.set("gene-family", family)
            typing.set("date", "2014-09-27")

            # Iterate over each locus in that family, adding an sbt tag for each
            for locus in self.loci_for_family(family):
                sbt_elem = et.SubElement(typing, "sbt-ngs")
                sbt_elem.set("locus", locus)

                # Find and process the records for this locus
                self._process_records_for_locus(locus, sbt_elem)

    def _process_records_for_locus(self, locus, sbt_elem):
        consensus_elem = et.SubElement(sbt_elem, "consensus-sequence")
        target_elem = et.SubElement(consensus_elem, "targeted-region")
        target_elem.set("assembly", "GRCh38")
        target_elem.set("contig", "6")
        target_elem.set("start", "29999999")
        target_elem.set("end", "30000000")
        for record in self.records_for_locus(locus):
            sequence_elem = et.SubElement(consensus_elem, "sequence")
            sequence_elem.set("alphabet", "DNA")
            sequence_elem.text = record.sequence

    @property
    def gene_families(self):
        return sorted_set([r.family for r in self._records])

    @property
    def loci(self):
        return sorted_set([r.locus for r in self._records])

    def loci_for_family(self, family):
        return [l for l in self.loci if l.startswith(family)]

    def records_for_locus(self, locus):
        return [r for r in self._records if r.locus == locus]

    def to_tree(self):
        if not self._processed:
            self._process_records()
            self._processed = True
        return et.ElementTree(self._hml)

    def __str__(self):
        if not self._processed:
            self._process_records()
            self._processed = True
        tree = et.ElementTree(self._hml)
        root = tree.getroot()
        return et.tostring(root, encoding='utf8', method='xml')
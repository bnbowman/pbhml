#!/bin/bash
# Setting up SMRTpipe environment
echo "Setting up ENV on $(uname -n)" for task doSplitBarcodeAmpliconAnalysis

SEYMOUR_HOME=/home/UNIXHOME/bbowman/builds/smrtanalysis-2.3.0
source $SEYMOUR_HOME/etc/setup.sh

# Create the local TMP dir if it doesn't exist
tmp_dir=$(readlink -m "/mnt/secondary-siv/nightlytest/siv4/smrtanalysis_140433/tmpdir")
if [ ! -e "$tmp_dir" ]; then
   stat=0
   mkdir -p $tmp_dir || stat=$?
   if [[ $stat -ne 0 ]]; then
       echo "SMRTpipe Unable to create TMP dir '/mnt/secondary-siv/nightlytest/siv4/smrtanalysis_140433/tmpdir' on $(uname -n)" 1>&2
       exit 1
   else
       echo "successfully created or found TMP dir '/mnt/secondary-siv/nightlytest/siv4/smrtanalysis_140433/tmpdir'"
   fi
elif [[ ! -d "$tmp_dir" ]]; then
   echo "SMRTpipe TMP /mnt/secondary-siv/nightlytest/siv4/smrtanalysis_140433/tmpdir must be a directory on $(uname -n)" 1>&2
   exit 1
fi

########### TASK metadata #############
# Task            : doSplitBarcodeAmpliconAnalysis
# Module          : P_AmpliconAnalysis
# Module Version  : 1.12.125061
# TaskType        : None
# URL             : task://Anonymous/P_AmpliconAnalysis/doSplitBarcodeAmpliconAnalysis
# createdAt       : 2014-09-16 17:12:22.324049
# createdAt (UTC) : 2014-09-17 00:12:22.324063
# ncmds           : 3
# LogPath         : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/log/P_AmpliconAnalysis/doSplitBarcodeAmpliconAnalysis.log
# Script Path     : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/workflow/P_AmpliconAnalysis/doSplitBarcodeAmpliconAnalysis.sh

# Input       : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn
# Input       : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcode.fofn
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/amplicon_analysis_zmws.csv
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/amplicon_analysis_summary.csv
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/amplicon_analysis.csv
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/amplicon_analysis_fasta.zip
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/amplicon_analysis_fastq.zip
#
########### END TASK metadata #############

cd /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/log/P_AmpliconAnalysis
# Writing to log file
cat /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/workflow/P_AmpliconAnalysis/doSplitBarcodeAmpliconAnalysis.sh >> /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/log/P_AmpliconAnalysis/doSplitBarcodeAmpliconAnalysis.log;



echo "Running task://Anonymous/P_AmpliconAnalysis/doSplitBarcodeAmpliconAnalysis on $(uname -a)"

echo "Started on $(date -u)"
echo 'Validating existence of Input Files'
if [ -e /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn ]
then
echo 'Successfully found /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn'
else
echo 'WARNING: Unable to find necessary input file, or dir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn.'
fi
if [ -e /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcode.fofn ]
then
echo 'Successfully found /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcode.fofn'
else
echo 'WARNING: Unable to find necessary input file, or dir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcode.fofn.'
fi
echo 'Successfully validated input files'

# Task doSplitBarcodeAmpliconAnalysis commands:


# Completed writing Task doSplitBarcodeAmpliconAnalysis commands


# Task 1
ConsensusTools.sh AmpliconAnalysis -vv  --ignoreEnds 50   --maxReads 2000   --minLength 3000    --minSnr 5.0     --parameters /home/UNIXHOME/bbowman/builds/smrtanalysis-2.3.0/analysis/etc/algorithm_parameters/2014-09 --numThreads 15   -o /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data --fofn /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn --barcodes /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcode.fofn  --minBarcodeScore 11   --fastxByBarcode || exit $?
echo "Task 1 completed at $(date)"
# Task 2
zip -9 -r amplicon_analysis_fasta.zip /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/amplicon_analysis_fasta.zip/*fasta || exit $?
echo "Task 2 completed at $(date)"
# Task 3
zip -9 -r amplicon_analysis_fastq.zip /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/amplicon_analysis_fastq.zip/*fastq || exit $?
echo "Task 3 completed at $(date)"



rcode=$?
echo "Finished on $(date -u)"
echo "Task doSplitBarcodeAmpliconAnalysis with nproc 15 with exit code ${rcode}."
exit ${rcode}
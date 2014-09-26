#!/bin/bash
# Setting up SMRTpipe environment
echo "Setting up ENV on $(uname -n)" for task doBarcodeAmpliconAnalysis

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
# Task            : doBarcodeAmpliconAnalysis
# Module          : P_AmpliconAnalysis
# Module Version  : 1.12.125061
# TaskType        : None
# URL             : task://Anonymous/P_AmpliconAnalysis/doBarcodeAmpliconAnalysis
# createdAt       : 2014-09-16 17:11:58.174691
# createdAt (UTC) : 2014-09-17 00:11:58.174713
# ncmds           : 1
# LogPath         : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_AmpliconAnalysis/doBarcodeAmpliconAnalysis.log
# Script Path     : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/workflow/P_AmpliconAnalysis/doBarcodeAmpliconAnalysis.sh

# Input       : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn
# Input       : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/barcode.fofn
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/amplicon_analysis.fasta
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/amplicon_analysis.fastq
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/amplicon_analysis_summary.csv
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/amplicon_analysis.csv
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/amplicon_analysis_zmws.csv
#
########### END TASK metadata #############

cd /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_AmpliconAnalysis
# Writing to log file
cat /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/workflow/P_AmpliconAnalysis/doBarcodeAmpliconAnalysis.sh >> /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_AmpliconAnalysis/doBarcodeAmpliconAnalysis.log;



echo "Running task://Anonymous/P_AmpliconAnalysis/doBarcodeAmpliconAnalysis on $(uname -a)"

echo "Started on $(date -u)"
echo 'Validating existence of Input Files'
if [ -e /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn ]
then
echo 'Successfully found /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn'
else
echo 'WARNING: Unable to find necessary input file, or dir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn.'
fi
if [ -e /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/barcode.fofn ]
then
echo 'Successfully found /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/barcode.fofn'
else
echo 'WARNING: Unable to find necessary input file, or dir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/barcode.fofn.'
fi
echo 'Successfully validated input files'

# Task doBarcodeAmpliconAnalysis commands:


# Completed writing Task doBarcodeAmpliconAnalysis commands


# Task 1
ConsensusTools.sh AmpliconAnalysis -vv  --ignoreEnds 50   --maxReads 2000   --minLength 3000    --minSnr 5.0     --parameters /home/UNIXHOME/bbowman/builds/smrtanalysis-2.3.0/analysis/etc/algorithm_parameters/2014-09 --numThreads 15   -o /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data --fofn /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn --barcodes /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/barcode.fofn  --minBarcodeScore 11   || exit $?
echo "Task 1 completed at $(date)"



rcode=$?
echo "Finished on $(date -u)"
echo "Task doBarcodeAmpliconAnalysis with nproc 15 with exit code ${rcode}."
exit ${rcode}
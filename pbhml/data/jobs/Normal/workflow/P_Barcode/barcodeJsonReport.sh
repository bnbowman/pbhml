#!/bin/bash
# Setting up SMRTpipe environment
echo "Setting up ENV on $(uname -n)" for task barcodeJsonReport

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
# Task            : barcodeJsonReport
# Module          : P_Barcode
# Module Version  : 1.6.139483
# TaskType        : None
# URL             : task://Anonymous/P_Barcode/barcodeJsonReport
# createdAt       : 2014-09-16 17:11:58.187960
# createdAt (UTC) : 2014-09-17 00:11:58.187988
# ncmds           : 2
# LogPath         : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_Barcode/barcodeJsonReport.log
# Script Path     : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/workflow/P_Barcode/barcodeJsonReport.sh

# Input       : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/barcode.fofn
# Input       : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/results/barcode_report.json
#
########### END TASK metadata #############

cd /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_Barcode
# Writing to log file
cat /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/workflow/P_Barcode/barcodeJsonReport.sh >> /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_Barcode/barcodeJsonReport.log;



echo "Running task://Anonymous/P_Barcode/barcodeJsonReport on $(uname -a)"

echo "Started on $(date -u)"
echo 'Validating existence of Input Files'
if [ -e /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/barcode.fofn ]
then
echo 'Successfully found /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/barcode.fofn'
else
echo 'WARNING: Unable to find necessary input file, or dir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/barcode.fofn.'
fi
if [ -e /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn ]
then
echo 'Successfully found /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn'
else
echo 'WARNING: Unable to find necessary input file, or dir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn.'
fi
echo 'Successfully validated input files'

# Task barcodeJsonReport commands:


# Completed writing Task barcodeJsonReport commands


# Task 1
barcode_report.py --debug  /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/barcode.fofn /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/results/barcode_report.json || exit $?
echo "Task 1 completed at $(date)"
# Task 2
smrtreporter -basedir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/results -headinclude /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/results/.martin_header.html --html -o barcode_report.html -rules /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/results/.rules_barcode_report.xml || exit $?
echo "Task 2 completed at $(date)"



rcode=$?
echo "Finished on $(date -u)"
echo "Task barcodeJsonReport with nproc 1 with exit code ${rcode}."
exit ${rcode}
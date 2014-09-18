#!/bin/bash
# Setting up SMRTpipe environment
echo "Setting up ENV on $(uname -n)" for task emitFastqs

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
# Task            : emitFastqs
# Module          : P_Barcode
# Module Version  : 1.6.139483
# TaskType        : None
# URL             : task://Anonymous/P_Barcode/emitFastqs
# createdAt       : 2014-09-16 17:12:22.367035
# createdAt (UTC) : 2014-09-17 00:12:22.367049
# ncmds           : 4
# LogPath         : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/log/P_Barcode/emitFastqs.log
# Script Path     : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/workflow/P_Barcode/emitFastqs.sh

# Input       : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcode.fofn
# Input       : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcoded-fastqs.tgz
#
########### END TASK metadata #############

cd /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/log/P_Barcode
# Writing to log file
cat /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/workflow/P_Barcode/emitFastqs.sh >> /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/log/P_Barcode/emitFastqs.log;



echo "Running task://Anonymous/P_Barcode/emitFastqs on $(uname -a)"

echo "Started on $(date -u)"
echo 'Validating existence of Input Files'
if [ -e /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcode.fofn ]
then
echo 'Successfully found /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcode.fofn'
else
echo 'WARNING: Unable to find necessary input file, or dir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcode.fofn.'
fi
if [ -e /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn ]
then
echo 'Successfully found /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn'
else
echo 'WARNING: Unable to find necessary input file, or dir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn.'
fi
echo 'Successfully validated input files'

# Task emitFastqs commands:


# Completed writing Task emitFastqs commands


# Task 1
mkdir -p /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcoded-fastqs || exit $?
echo "Task 1 completed at $(date)"
# Task 2
pbbarcode emitFastqs --minAvgBarcodeScore 11  --subreads  --outDir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcoded-fastqs /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcode.fofn || exit $?
echo "Task 2 completed at $(date)"
# Task 3
pushd /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcoded-fastqs && tar czf ../barcoded-fastqs.tgz *.fastq && popd || exit $?
echo "Task 3 completed at $(date)"
# Task 4
rm -rf /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/data/barcoded-fastqs || exit $?
echo "Task 4 completed at $(date)"



rcode=$?
echo "Finished on $(date -u)"
echo "Task emitFastqs with nproc 1 with exit code ${rcode}."
exit ${rcode}
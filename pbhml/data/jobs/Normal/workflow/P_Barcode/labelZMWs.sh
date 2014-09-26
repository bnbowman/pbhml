#!/bin/bash
# Setting up SMRTpipe environment
echo "Setting up ENV on $(uname -n)" for task labelZMWs

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
# Task            : labelZMWs
# Module          : P_Barcode
# Module Version  : 1.6.139483
# TaskType        : None
# URL             : task://Anonymous/P_Barcode/labelZMWs
# createdAt       : 2014-09-16 17:11:58.171849
# createdAt (UTC) : 2014-09-17 00:11:58.171869
# ncmds           : 1
# LogPath         : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_Barcode/labelZMWs.log
# Script Path     : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/workflow/P_Barcode/labelZMWs.sh

# Input       : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/barcode.fofn
#
########### END TASK metadata #############

cd /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_Barcode
# Writing to log file
cat /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/workflow/P_Barcode/labelZMWs.sh >> /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_Barcode/labelZMWs.log;



echo "Running task://Anonymous/P_Barcode/labelZMWs on $(uname -a)"

echo "Started on $(date -u)"
echo 'Validating existence of Input Files'
if [ -e /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn ]
then
echo 'Successfully found /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn'
else
echo 'WARNING: Unable to find necessary input file, or dir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn.'
fi
echo 'Successfully validated input files'

# Task labelZMWs commands:


# Completed writing Task labelZMWs commands


# Task 1
pbbarcode -vv labelZmws --nProcs 1 --outFofn /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data/barcode.fofn --outDir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/data --scoreMode paired --adapterSidePad 0 --insertSidePad 0 --scoreFirst /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/SMRTbell_4x_barcodes.fasta /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn || exit $?
echo "Task 1 completed at $(date)"



rcode=$?
echo "Finished on $(date -u)"
echo "Task labelZMWs with nproc 1 with exit code ${rcode}."
exit ${rcode}
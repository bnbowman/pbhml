#!/bin/bash
# Setting up SMRTpipe environment
echo "Setting up ENV on $(uname -n)" for task overviewRpt

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
# Task            : overviewRpt
# Module          : P_Fetch
# Module Version  : 2.4.139483
# TaskType        : None
# URL             : task://Anonymous/P_Fetch/overviewRpt
# createdAt       : 2014-09-16 17:12:22.320258
# createdAt (UTC) : 2014-09-17 00:12:22.320275
# ncmds           : 2
# LogPath         : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/log/P_Fetch/overviewRpt.log
# Script Path     : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/workflow/P_Fetch/overviewRpt.sh

# Input       : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/results/overview.json
#
########### END TASK metadata #############

cd /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/log/P_Fetch
# Writing to log file
cat /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/workflow/P_Fetch/overviewRpt.sh >> /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/log/P_Fetch/overviewRpt.log;



echo "Running task://Anonymous/P_Fetch/overviewRpt on $(uname -a)"

echo "Started on $(date -u)"
echo 'Validating existence of Input Files'
if [ -e /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn ]
then
echo 'Successfully found /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn'
else
echo 'WARNING: Unable to find necessary input file, or dir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn.'
fi
echo 'Successfully validated input files'

# Task overviewRpt commands:


# Completed writing Task overviewRpt commands


# Task 1
overview_report.py --debug /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/input.fofn /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/results/overview.json || exit $?
echo "Task 1 completed at $(date)"
# Task 2
smrtreporter -basedir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/results -headinclude /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/results/.martin_header.html --html -o overview.html -rules /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Split_11/results/.rules_overview.xml || exit $?
echo "Task 2 completed at $(date)"



rcode=$?
echo "Finished on $(date -u)"
echo "Task overviewRpt with nproc 1 with exit code ${rcode}."
exit ${rcode}
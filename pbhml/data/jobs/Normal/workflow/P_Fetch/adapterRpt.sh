#!/bin/bash
# Setting up SMRTpipe environment
echo "Setting up ENV on $(uname -n)" for task adapterRpt

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
# Task            : adapterRpt
# Module          : P_Fetch
# Module Version  : 2.4.139483
# TaskType        : None
# URL             : task://Anonymous/P_Fetch/adapterRpt
# createdAt       : 2014-09-16 17:11:58.190694
# createdAt (UTC) : 2014-09-17 00:11:58.190717
# ncmds           : 2
# LogPath         : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_Fetch/adapterRpt.log
# Script Path     : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/workflow/P_Fetch/adapterRpt.sh

# Input       : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/results/filter_reports_adapters.json
#
########### END TASK metadata #############

cd /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_Fetch
# Writing to log file
cat /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/workflow/P_Fetch/adapterRpt.sh >> /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_Fetch/adapterRpt.log;



echo "Running task://Anonymous/P_Fetch/adapterRpt on $(uname -a)"

echo "Started on $(date -u)"
echo 'Validating existence of Input Files'
if [ -e /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn ]
then
echo 'Successfully found /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn'
else
echo 'WARNING: Unable to find necessary input file, or dir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn.'
fi
echo 'Successfully validated input files'

# Task adapterRpt commands:


# Completed writing Task adapterRpt commands


# Task 1
pbreport.py adapter /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/results filter_reports_adapters.json /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn || exit $?
echo "Task 1 completed at $(date)"
# Task 2
smrtreporter -basedir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/results -headinclude /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/results/.martin_header.html --html -o filter_reports_adapters.html -rules /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/results/.rules_filter_reports_adapters.xml || exit $?
echo "Task 2 completed at $(date)"



rcode=$?
echo "Finished on $(date -u)"
echo "Task adapterRpt with nproc 1 with exit code ${rcode}."
exit ${rcode}
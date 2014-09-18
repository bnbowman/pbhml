#!/bin/bash
# Setting up SMRTpipe environment
echo "Setting up ENV on $(uname -n)" for task toFofn

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
# Task            : toFofn
# Module          : P_Fetch
# Module Version  : 2.4.139483
# TaskType        : None
# URL             : task://Anonymous/P_Fetch/toFofn
# createdAt       : 2014-09-16 17:11:58.138397
# createdAt (UTC) : 2014-09-17 00:11:58.138425
# ncmds           : 4
# LogPath         : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_Fetch/toFofn.log
# Script Path     : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/workflow/P_Fetch/toFofn.sh

# Input       : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.xml
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn
#
########### END TASK metadata #############

cd /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_Fetch
# Writing to log file
cat /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/workflow/P_Fetch/toFofn.sh >> /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/log/P_Fetch/toFofn.log;



echo "Running task://Anonymous/P_Fetch/toFofn on $(uname -a)"

echo "Started on $(date -u)"
echo 'Validating existence of Input Files'
if [ -e /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.xml ]
then
echo 'Successfully found /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.xml'
else
echo 'WARNING: Unable to find necessary input file, or dir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.xml.'
fi
echo 'Successfully validated input files'

# Task toFofn commands:


# Completed writing Task toFofn commands


# Task 1
rm -f /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn || exit $?
echo "Task 1 completed at $(date)"
# Task 2
echo '/mnt/secondary-siv/testdata/exth5/HLA_pool2/Analysis_Results/m140307_221913_42203_c100626172550000001823119008061414_s1_p0.1.bax.h5' >> /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn || exit $?
echo "Task 2 completed at $(date)"
# Task 3
echo '/mnt/secondary-siv/testdata/exth5/HLA_pool2/Analysis_Results/m140307_221913_42203_c100626172550000001823119008061414_s1_p0.2.bax.h5' >> /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn || exit $?
echo "Task 3 completed at $(date)"
# Task 4
echo '/mnt/secondary-siv/testdata/exth5/HLA_pool2/Analysis_Results/m140307_221913_42203_c100626172550000001823119008061414_s1_p0.3.bax.h5' >> /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Normal_11/input.fofn || exit $?
echo "Task 4 completed at $(date)"



rcode=$?
echo "Finished on $(date -u)"
echo "Task toFofn with nproc 1 with exit code ${rcode}."
exit ${rcode}
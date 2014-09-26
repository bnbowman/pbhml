#!/bin/bash
# Setting up SMRTpipe environment
echo "Setting up ENV on $(uname -n)" for task ampliconAnalysisConsensusReport

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
# Task            : ampliconAnalysisConsensusReport
# Module          : P_AmpliconAnalysis
# Module Version  : 1.12.125061
# TaskType        : None
# URL             : task://Anonymous/P_AmpliconAnalysis/ampliconAnalysisConsensusReport
# createdAt       : 2014-09-16 15:38:46.127610
# createdAt (UTC) : 2014-09-16 22:38:46.127629
# ncmds           : 2
# LogPath         : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/log/P_AmpliconAnalysis/ampliconAnalysisConsensusReport.log
# Script Path     : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/workflow/P_AmpliconAnalysis/ampliconAnalysisConsensusReport.sh

# Input       : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/data/amplicon_analysis_summary.csv
# Output      : /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/results/amplicon_analysis_consensus_report.json
#
########### END TASK metadata #############

cd /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/log/P_AmpliconAnalysis
# Writing to log file
cat /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/workflow/P_AmpliconAnalysis/ampliconAnalysisConsensusReport.sh >> /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/log/P_AmpliconAnalysis/ampliconAnalysisConsensusReport.log;



echo "Running task://Anonymous/P_AmpliconAnalysis/ampliconAnalysisConsensusReport on $(uname -a)"

echo "Started on $(date -u)"
echo 'Validating existence of Input Files'
if [ -e /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/data/amplicon_analysis_summary.csv ]
then
echo 'Successfully found /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/data/amplicon_analysis_summary.csv'
else
echo 'WARNING: Unable to find necessary input file, or dir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/data/amplicon_analysis_summary.csv.'
fi
echo 'Successfully validated input files'

# Task ampliconAnalysisConsensusReport commands:


# Completed writing Task ampliconAnalysisConsensusReport commands


# Task 1
amplicon_analysis_consensus_report.py --debug /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/data/amplicon_analysis_summary.csv /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/results/amplicon_analysis_consensus_report.json || exit $?
echo "Task 1 completed at $(date)"
# Task 2
smrtreporter -basedir /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/results -headinclude /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/results/.martin_header.html --html -o amplicon_analysis_consensus_report.html -rules /home/UNIXHOME/bbowman/2014/09/HLA_Hackathon/Single_11/results/.rules_amplicon_analysis_consensus_report.xml || exit $?
echo "Task 2 completed at $(date)"



rcode=$?
echo "Finished on $(date -u)"
echo "Task ampliconAnalysisConsensusReport with nproc 1 with exit code ${rcode}."
exit ${rcode}
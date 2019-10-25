@echo off
REM Edit path for your instance
echo==============Initializing.....................
SET _datetime=%DATE:~7,2%-%DATE:~4,2%-%DATE:~10,4%
ECHO Date: %DATE% >> K:\Daily\Daily-Backup-Dell-Kace-%_datetime%.log
ECHO Time: %TIME% >> K:\Daily\Daily-Backup-Dell-Kace-%_datetime%.log
echo Please wait...................................
echo ######################################################### >> K:\Daily\Daily-Backup-Dell-Kace-%_datetime%.log
echo #an automatically generated delivery status notification# >> K:\Daily\Daily-Backup-Dell-Kace-%_datetime%.log
echo ######################################################### >> K:\Daily\Daily-Backup-Dell-Kace-%_datetime%.log
REM Syncronize one way -----------------------------------------------------------------------------------------------------------------------
"c:\program files (x86)\winscp\winscp.com" /script="C:\Scripts\Dell-kace-backup-engine.txt" >> K:\Daily\Daily-Backup-Dell-Kace-%_datetime%.log
Start /wait C:\Scripts\Winscp_retensi.bat /q /passive
echo ######################################################### >> K:\Daily\Daily-Backup-Dell-Kace-%_datetime%.log
echo #                    created by      ..                 # >> K:\Daily\Daily-Backup-Dell-Kace-%_datetime%.log
echo ######################################################### >> K:\Daily\Daily-Backup-Dell-Kace-%_datetime%.log
REM Ratensi local (NAS) ---------------------------------------------------------------------------------------------------------------------- 
forfiles /P "L:" /S /M *.tgz /D -7 /C "cmd /c del @path" 
forfiles /P "L:" /S /M *.manifest /D -7 /C "cmd /c del @path"
REM Done -------------------------------------------------------------------------------------------------------------------------------------
:eof
exit

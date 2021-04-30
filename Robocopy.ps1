$SourcePath = '\\location\to\your\file'
$DestinationPath = 'D:\where\you\want\it\to\go'
$Logfile = 'c:\temp\robocopy.txt'
Robocopy $SourcePath $DestinationPath /e /z /dcopy:dat /copyall /r:5 /w:5 /log:$logfile /tee /np 

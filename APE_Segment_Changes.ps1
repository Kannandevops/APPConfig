
write-output "$(get-date) : Queue Segment Test" | out-file $LOG_FILE -Append -Force;
$timestamp=(Get-Date).ToString('dd-MM-yyyy hh-mm-ss');


$LOG_FILE= "APE_Segments_"+$timestamp +".log"


write-output "$(get-date) : Taking Global Setting File Backup" | out-file $LOG_FILE -Append -Force;  
Copy-Item -Path  "E:\EPS\globalsettings.xml" -Destination "E:\EPS\globalsettings_$timestamp .xml" -Force 


write-output "$(get-date) : Changing the thread count from 1 to 3" | out-file $LOG_FILE -Append -Force;  
$file=Get-Content E:\EPS\globalsettings.xml
$file -replace 'threads="1" ','threads="3" ' | Out-File E:\EPS\globalsettings.xml


write-output "$(get-date) : Stopping the APE service" | out-file $LOG_FILE -Append -Force;  
Stop-Service -Name "APEService"

write-output "$(get-date) : Sleeping" | out-file $LOG_FILE -Append -Force;  
Start-Sleep -s 20

write-output "$(get-date) : Starting the APE service" | out-file $LOG_FILE -Append -Force;  
Start-Service -Name "APEService"


write-output "$(get-date) : Exiting" | out-file $LOG_FILE -Append -Force;  
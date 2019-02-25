#
# defrag.ps1
#
$action =New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument 'Optimize-Volume -DriveLetter C -Defrag -ReTrim -AsJob'
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Friday -At 3pm
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Defrag" -Description "defragmentacja"
$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument 'Remove-Item @("C:\Windows\Temp\*", "C:\Windows\Prefetch\*", "C:\Dell\*" , "C:\Intel\*" , "C:\Documents and Settings\*\Local Settings\temp\*", "C:\Users\*\Appdata\Local\Temp\*") -force -recurse -ErrorAction SilentlyContinue'
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Friday -At 2pm
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "CleanTemp" -Description "Czyszczenie folderów TEMP"
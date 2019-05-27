#Grabs the date and time (24-Hour) in YearMonthDay_HourMinuteSecond format at the time of beginning the baseline
$currentDateTime = Get-Date -UFormat "%Y%m%d_%H%M%S"

$filename = Write-Output "$($currentDateTime)_enumeration"
$filepath = Write-Output $env:USERPROFILE\Desktop\$filename.txt

#Write-Output $env:USERPROFILE\Desktop\$filename.txt
#Write-Output $filepath

Write-Output "" | Out-File -filepath $filepath

Get-Date | Out-File -filepath $filepath -Append

Write-Output Hostname: $env:COMPUTERNAME | Out-File -filepath $filepath -Append

#Local Users, Local Groups, and groups assigned to the users
Write-Output "========== Local Users ==========" | Out-File -filepath $filepath -Append
Get-LocalUser | Select-Object Name, Enabled | Out-File -filepath $filepath -Append

Write-Output "========== Local Groups ==========" | Out-File -filepath $filepath -Append
Get-LocalGroup | Select-Object Name | Out-File -filepath $filepath -Append

Write-Output "========== User Group Memberships ==========" | Out-File -filepath $filepath -Append
Get-LocalGroup | Get-LocalGroupMember | Out-File -filepath $filepath -Append

#Get Process Name, PID, and execution path (for most)
Write-Output "========== Process Information ==========" | Out-File -filepath $filepath -Append
Get-Process | Select-Object Name, ID, Path | Out-File -filepath $filepath -Append

#Get service name, expanded display name, and run status
Write-Output "========== Service Information ==========" | Out-File -filepath $filepath -Append
Get-Service | Select-Object Name, DisplayName, Status | Out-File -filepath $filepath -Append

#Get network information
Write-Output "========== Network Information ==========" | Out-File -filepath $filepath -Append
Get-NetIPConfiguration | Out-File -filepath $filepath -Append
Get-NetIPAddress | Format-Table ifIndex, IPAddress, PrefixLength, PrefixOrigin, SuffixOrigin | Out-File -filepath $filepath -Append

#Get Listening and Established network sockets
Write-Output "========== Established and Listening Sockets ==========" | Out-File -filepath $filepath -Append
Get-NetTCPConnection -State Established,Listen | Out-File -filepath $filepath -Append

Write-Output "========== UDP Connections ==========" | Out-File -filepath $filepath -Append
Get-NetUDPEndpoint | Out-File -filepath $filepath -Append

#Get installed processors
Write-Output "========== Installed Processors ==========" | Out-File -filepath $filepath -Append
Get-WmiObject -Class Win32_Processor | Format-Table | Out-File -filepath $filepath -Append

#Get Hotfixes
Write-Output "========== Applied Hotfixes ==========" | Out-File -filepath $filepath -Append
Get-HotFix | Out-File -filepath $filepath -Append

#Get Base OS Information
Write-Output "========== OS Information ==========" | Out-File -filepath $filepath -Append
Get-WmiObject win32_operatingsystem | Select-Object Name, __CLASS, OSArchitecture, Version | Format-List | Out-File -filepath $filepath -Append

#Mapped Devices
Write-Output "========== Devices Mapped to Machine ==========" | Out-File -filepath $filepath -Append
Get-PSDrive | Select-Object Name, Provider, Root, Description | Out-File -filepath $filepath -Append

#Plug and Play Device list
Write-Output "========== Plug and Play Devices ==========" | Out-File -filepath $filepath -Append
Get-PnpDevice | Select-Object Class, FriendlyName, InstanceId | Out-File -filepath $filepath -Append

#Shared Drives
Write-Output "========== Shared Windows Resources ==========" | Out-File -filepath $filepath -Append
Get-WmiObject -Class Win32_Share | Out-File -filepath $filepath -Append

#Scheduled Tasks
Write-Output "========== Scheduled Tasks ==========" | Out-File -filepath $filepath -Append
Get-ScheduledTask | Out-File -filepath $filepath -Append
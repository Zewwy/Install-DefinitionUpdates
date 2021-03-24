#Simulates clicking "Check for updates"
UsoClient StartScan
#command to install definition updates, no GUI equivilent AFAIK
Update-MpSignature
#Do it again to be sure
UsoClient StartScan
Update-MpSignature
#Report to WSUS
wuauclt /reportnow
#WSUS never gets it right, do it again and it does?
sleep 30
UsoClient StartScan
wuauclt /reportnow

#If logs folder doesn't exist, create it
if(!(Test-Path C:\Logs))
{
   New-Item -ItemType Directory -Path C:\Logs 
}

#Report to local log file of completed task
Add-Content -Path c:\Logs\DefinitionUpdateLog.log -Value "Definition Updates installed as of $(Get-Date)"

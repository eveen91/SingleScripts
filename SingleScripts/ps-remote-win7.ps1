#
# ps_remote_win7.ps1
#
#Skip network location setting for pre-Vista operating systems 

reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f
Enable-PSRemoting -Force
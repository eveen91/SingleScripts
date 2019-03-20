#
# windows10updateto1809.ps1
#
#copy iso
Copy-Item "\\vcgdysrnas01\dwi\PUBLIC\Windows.iso" -Destination C:\Users\vectrauser\AppData\Local\DwiTools\

#unpack
$iso=ls C:\Users\vectrauser\AppData\Local\DwiTools\*.iso
$mount_params = @{ImagePath = $iso; PassThru = $true; ErrorAction = "Ignore"}
$mount = Mount-DiskImage @mount_params
     if($mount) {

         $volume = Get-DiskImage -ImagePath $mount.ImagePath | Get-Volume
         $source = $volume.DriveLetter + ":\*"
         $folder = mkdir C:\Users\vectrauser\AppData\Local\DwiTools\Windows\
        # Write-Host "Extracting '$iso' to '$folder'..."
         $params = @{Path = $source; Destination = $folder; Recurse = $true;}
         cp @params
         $hide = Dismount-DiskImage @mount_params
        # Write-Host "Copy complete"
}
#update
Start-Process C:\Users\vectrauser\AppData\Local\DwiTools\Windows\setup.exe -ArgumentList "/auto upgrade /quiet /noreboot /compat ignorewarning" -Wait
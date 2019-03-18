#
# PsTools.ps1
#
$destination= 'C:\Users\vectrauser\AppData\Local\DwiTools\'
function get_dropbox_file($file)
{
	$token=Z5-BtjmM42AAAAAAAAAAD_w63qwP6Nc-0y8mJj-36iyO6qd8n6OwwjwL1NRApBK2
	$uri=https://content.dropboxapi.com/2/files/download
	$header=""
	Invoke-WebRequest -Uri -Headers
}

if( -Not (Test-Path -Path $destination ) )
{
   New-Item -ItemType directory -Path $destination
}

#Invoke-RestMethod
#curl -X POST https://content.dropboxapi.com/2/files/download \ --header "Authorization: Bearer <Z5-BtjmM42AAAAAAAAAAD_w63qwP6Nc-0y8mJj-36iyO6qd8n6OwwjwL1NRApBK2>" \ --header "Dropbox-API-Arg: {\"path\": \"/Homework/math/Prime_Numbers.txt\"}" \ -o "./Prime_Numbers.txt"
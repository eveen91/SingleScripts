#
# PsTools.ps1
#
curl -X POST https://content.dropboxapi.com/2/files/download \ --header "Authorization: Bearer <Z5-BtjmM42AAAAAAAAAAD_w63qwP6Nc-0y8mJj-36iyO6qd8n6OwwjwL1NRApBK2>" \ --header "Dropbox-API-Arg: {\"path\": \"/Homework/math/Prime_Numbers.txt\"}" \ -o "./Prime_Numbers.txt"
$env:Path += ";C:\Program Files\VcXsrv"
$env:DISPLAY = "localhost:0"
vcxsrv :0 -multiwindow
vagrant up
vagrant ssh

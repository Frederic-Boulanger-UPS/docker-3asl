$env:Path += ";C:\Program Files\VcXsrv"
$env:DISPLAY = "localhost:0"
vcxsrv :0 -multiwindow
docker run --rm -it -v "$(PWD):/workspace:rw" --name 3asl2020 --env="DISPLAY=host.docker.internal:0" fredblgr/3asl:2020

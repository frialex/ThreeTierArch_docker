cd $PSScriptRoot

cd web


$imageId = "--iidfile 'imageid' "
$tag = " --tag kewlwebapp:aug17"
$hostfile = " --add-host somerandom.com:127.0.0.1"

$arguments = $imageId + $tag + $hostfile
write-host $arguments

$command = "docker build  $arguments ."
write-host $command

iex $command
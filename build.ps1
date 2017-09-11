cd $PSScriptRoot

function build-webimage()
{
    cd $PSScriptRoot
    cd web


    $tag = " --tag kewlwebapp:aug17"
    $hostfile = " --add-host somerandom.com:127.0.0.1"

    $arguments = $tag + $hostfile
    docker-build $arguments
}


function build-appimage()
{
    cd $PSScriptRoot
    cd app
    $tag = " --tag awesome-app-service:aug17"

    docker-build $tag

}

#assuming that this is called from the directory with Dockerfile
function docker-build($arguments)
{
    write-host $arguments

    $command = "docker build  $arguments ."
    write-host $command

    iex $command

}





#-------Start
build-appimage

build-webimage
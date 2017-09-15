cd $PSScriptRoot

#Not available on windows containers... damn..
$link = " --link to_another_container_by_name?"


#TODO: Verify these work as expected..
$port = " -p 80"
$hosts = " --add-host kewl.com:127.0.0.1"
$network = " --network  join_this_network  or_multiple_networks"


#TODO: Figure out how to use these...
$hostDevice = " --device TODO"
$customDNS = "--dns TODO"
$env = " --env wow:now"
$expose = "TODO"
$ipc = " --ipc string" #what is IPC?

$volume = " --volume whats_the_difference_between_this_and_mount?"
$networkAlias = " --network-alias wtf_is_this"


#-------------TODO----------- could this be used to mount /bin over network?
$mount = " --mount file_system_mount_to_container"


#TODO: [DEMO Request]  Web -> app -> database 
    #demonstrate that packet from web container reacher hyperv switch, which then resolves "appServerName" to app,
    # it then forwards the call to app. This process repeats for app -> database


function docker-run-app($image)
{
    $name = "--name kewlappservice"
    $exposeAllPorts = "-P"
    $autoRemove = "--rm"
    $hostname = "--hostname kewlservice" #TODO: How come this is not registered with the network? --name is used instead


    $parameter = "$name $exposeAllPorts $autoRemove $hostname"
    $wow = "docker run -dt $parameter $image"

    write-host $wow
    Invoke-Expression $wow
}


function docker-run-web($image)
{
    $name = " --name kewlwebapp"  #by setting a name to the container, we can select it easier: $web = docker container inspect nameOf_web_container | ConvertFrom-Json
    $exposeAllPorts = " -P" #capital p
    $autoRemove = " --rm "
    $hostname = " --hostname kewl"


    $parameter = "$name $exposeAllPorts $autoRemove $hostname"

    $wow = "docker run -dt $parameter $image"
    write-host $wow

    Invoke-Expression $wow
}

function docker-run-web_with-shell($image)
{
    
    $name = " --name webappshell"
    $autoRemove = " --rm"
    $hostname =" --hostname kewlshell"
    $entryPoint = " --entrypoint powershell  -it" #need to add -interactive because we want to be dropped in to powershell and -tty just incase

    $parameter = "$name $autoRemove $hostname $entryPoint"

    #run in detached mode. (powershell ise can't connect to tty on docker)
    $command = "docker run -d $parameter $image"
    write-host $command

    Invoke-Expression $command
}

function runit()
{
    write-host "---------------- Creating container from web image -------------------"
    write-host "----------------------------------------------------------------------"

    $webid = docker-run-web "kewlwebapp:aug17"
    


    write-host "-----------------Running powershell container on app------------------"
    write-host "----------------------------------------------------------------------"
    $webid = docker-run-app "kewlappservice:aug17"


    write-host "-----------------Running powershell container on web------------------"
    write-host "----------------------------------------------------------------------"
    
    docker-run-web_with-shell "kewlwebapp:aug17"



    write-host "Web containers id = $webid"
}
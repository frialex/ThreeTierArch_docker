$root = $PSScriptRoot

Write-Host "Running full automation on $root"

#---------------------------------------------------------------------------------------------------------
#---Commenting out build for now since there are no changes to the docker files that produce those images.
#---------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------
#----- uncomment to apply changes to the code on to the images -------------------------------------------
Write-Host "Creating image from source"
#./build.ps1



#---------------------------------------------------------------------------------------------------------
#------------- This is basically the job of "container orchastrators" and "YML" files --------------------
Write-Host "Importing function to run containers from image"
./Run.ps1



$allcontainerids = runit 

#quick hack..
$webContainerId  = $allcontainerids | select -First 1

write-host "For web, selected container with id = $webContainerId"


#Now that we have an environment setup and running locally,
#open the public endpoint of that environment so the user can interact with it.

function Get-ContainerIP($containerId)
{
    Write-Host "Getting IP for containerid = $containerid"
    #Need to get the IP from the network interface.... there might be a way with the docker client (without attaching to the container)
    #$crowwebapicontainer = docker container inspect crow.webapi | ConvertFrom-Json

    #TODO: This is why we should have networks for major application groups. It allows us to reference just those groups to get at a containers ip that we are interested in.
    #... on the other hand... we keep track of the web containers id, which will allow us to get at the same information
    $dockerNat = docker network inspect nat | ConvertFrom-Json

    #TODO: Whats the xxx.xxx.xxx.xxx/xx  ip format called?
    $ipDINS = $dockerNat.Containers.$webContainerId.IPv4Address
    $ip4real = $ipDINS.Split("/") | select -first 1

    Write-Host $ip4real

    $ip4real
}

function Try-HittingContainer($ip, $port = 80)
{
    $url = "http://${ip}:${port}/api/values"

    Write-Host "Http -> $url"
    $resp = Invoke-WebRequest $url
    Write-Host " Server -> $resp "

    $resp
}

function Open-ChromeOnContainer($containerId){
    $crowWebIP = Get-ContainerIP $containerId
    
    $url = "http://$crowWebIP/api/values"
    
    Start-Process "chrome.exe" $url
}



Open-ChromeOnContainer $webContainerId
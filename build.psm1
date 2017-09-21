cd $PSScriptRoot



function build-app($tag)
{
    cd $PSScriptRoot
    cd app/source/app
    rm -Recurse bin
    dotnet build -o bin

    cd ..

    docker build -t $tag  . 

}


function build-web($tag)
{
    cd $PSSCriptRoot
    cd web/api
    rm -Recurse bin
    dotnet build -o bin

    cd ..

    docker build -t $tag .
}


function build-database($tag)
{
    #this is a bit trickier since we have to move around the "data" volumes also to dev laptops, and up/down through the regions


}


function build-all-images
{

    build-app "claim/crow/appservice:aug17"

    build-web "claim/crow/webapi:aug17"

}
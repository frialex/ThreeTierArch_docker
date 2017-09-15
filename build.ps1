cd $PSScriptRoot



function build-app
{
    cd app/source/app
    rm bin
    dotnet build -o bin

    cd ..

    docker build -t kewlappservice:aug17  . 

}

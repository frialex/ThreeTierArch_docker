FROM  travelers/claim-base
SHELL ["powershell", "-command"]


#TODO:
#like the rest of them

MAINTAINER  someResponsiblePerson@email.comm
LABEL   travelers.version="aug18" \
        travelers.train="AgileTrainTeam" \
        travelers.train.dev="name@email;name@email" \
        travelers.train.certified="name@email;name@email;name@email" \
        travelers.train.notify="name@email;name@email;name@email" 


COPY bin /app
WORKDIR /app
#RUN infiniteloop.ps1 will cause the image builder to run that loop. It will become stuck in that loop ..
ENTRYPOINT ["dotnet", "app.dll"]
 

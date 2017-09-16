FROM  travelers/claim/base/2018
SHELL ["powershell", "-command"]


#TODO:
#like the rest of them

MAINTAINER  someResponsiblePerson@email.comm
LABEL   travelers.version="aug18" \
        travelers.train="AgileTrainTeam" \
        travelers.train.dev="name@email;name@email" \
        travelers.train.certified="name@email;name@email;name@email" \
        travelers.train.notify="name@email;name@email;name@email" 


COPY  app/bin /app
WORKDIR /app


EXPOSE 5000

#RUN infiniteloop.ps1 will cause the image builder to run that loop. It will become stuck in that loop ..
ENTRYPOINT ["dotnet", "app.dll"]
 

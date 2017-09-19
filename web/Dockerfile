FROM travelers/claim/base/2018

#https://github.com/Microsoft/iis-docker/blob/master/nanoserver/Dockerfile

#TODO: docker attach still connects to a cmd shell. Is there a way to change that?
SHELL ["powershell", "-command"]
RUN New-Item c:\becauseWeSwitchedTheShellToPowershell


MAINTAINER someResponsiblePerson@email.com

#Docker daemon has http endpoints for everything available in the cli..
#We can build a "reporting dashboard" using those endpoints.



#analogy: stickers on the container
LABEL   travelers.version="aug18" \
        travelers.train="AgileTrainTeam" \
        travelers.train.dev="name@email;name@email" \
        #all of the people that have looked at this container. this will come in handy in times of troubleshooting.
        travelers.train.certified="name@email;name@email;name@email" \
        #The ui that shows the container movements should have options to be notified of them also
        travelers.train.notify="anyone@that.wants;to@be.notified;of@movements"



#check out VOLUME or :  https://docs.docker.com/engine/admin/volumes/bind-mounts/#start-a-container-with-a-bind-mount


COPY api/bin /web



EXPOSE 5000

#https://docs.docker.com/engine/reference/builder/#workdir
WORKDIR /web
ENTRYPOINT ["dotnet", "api.dll"]




#https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-docker/manage-windows-dockerfile




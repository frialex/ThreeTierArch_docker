FROM microsoft/aspnetcore

#https://github.com/Microsoft/iis-docker/blob/master/nanoserver/Dockerfile

#TODO: docker attach still connects to a cmd shell. Is there a way to change that?
SHELL ["powershell", "-command"]
RUN New-Item c:\becauseWeSwitchedTheShellToPowershell


MAINTAINER someResponsiblePerson@email.com

#Docker daemon has http endpoints for everything available in the cli..
#We can build a "reporting dashboard" using those endpoints.



#anlogy: stickers on the container
LABEL   travelers.version="aug18" \
        travelers.train="AgileTrainTeam" \
        travelers.train.dev="name@email;name@email" \
        #all of the people that have looked at this container. this will come in handy in times of troubleshooting.
        travelers.train.certified="name@email;name@email;name@email" \
        #The ui that shows the container movements should have options to be notified of them also
        travelers.train.notify="anyone@that.wants;to@be.notified;of@movements"


#TODO: These should be part of the image... 
#RUN mkdir d-read
#RUN mkdir logs


#host/source should not be copied over to container.
#This could be expensive...Going to try and use a volume instead
#/web should mount to /bin of the Web.UI project
COPY source /web

#[TODO: bind mount source/bin -> /web]
#it requires passing 
#https://docs.docker.com/engine/admin/volumes/bind-mounts/#start-a-container-with-a-bind-mount



#https://docs.docker.com/engine/reference/builder/#workdir
WORKDIR /web
RUN ./start.ps1




#https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-docker/manage-windows-dockerfile




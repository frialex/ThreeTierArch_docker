#FROM travelers/batchserver


LABEL   travelers.version="aug18" \
        travelers.train="AgileTrainTeam" \
        travelers.train.dev="name@email;name@email" \
        #all of the people that have looked at this container. this will come in handy in times of troubleshooting.
        travelers.train.certified="name@email;name@email;name@email" \
        #The ui that shows the container movements should have options to be notified of them also
        travelers.train.notify="anyone@that.wants;to@be.notified;of@movements"


#TODO: Mount a volume from /host/application/batch/bin -> /batch
#this will allow us to run the batch program inside a container,
#and also capture any changes made to source with SVN!!!

WORKDIR /batch
ENTRYPOINT ["scheduleJob.exe", "arguments"]

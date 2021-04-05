# Creates docker container
#       original source:
#           https://github.com/scitran-apps/fsl-bet/blob/master/Dockerfile
#       modified by amf on April 2 2021 for fsl-slicesdir gear
#

#############################################
# Select the OS
FROM flywheel/fsl-base:6.0.1
MAINTAINER Ariana Familiar <familiara@chop.edu>

#############################################
# Setup default flywheel/v0 directory
ENV FLYWHEEL=/flywheel/v0
RUN mkdir -p ${FLYWHEEL}
WORKDIR ${FLYWHEEL}
COPY run ${FLYWHEEL}/run
COPY manifest.json ${FLYWHEEL}/manifest.json

#############################################
# Configure entrypoint
RUN chmod a+x /flywheel/v0/run
ENTRYPOINT ["/flywheel/v0/run"]
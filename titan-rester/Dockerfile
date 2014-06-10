FROM jamesdbloom/docker-java7-maven

ENV DEBIAN_FRONTEND noninteractive

#Install Titan + Rexster
RUN git clone https://github.com/sahardge/Titan-Rexster.git
RUN cd Titan-Rexster && bash install-titan.sh

#Make Persisted volume
RUN mkdir /mountedvol


WORKDIR /rexster

EXPOSE 8182 8183 8184


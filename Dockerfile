FROM java:8

RUN apt-get update
RUN apt-get install apt-transport-https

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update
RUN apt-get install sbt

RUN mkdir /opt/project
ADD ./ /opt/project

WORKDIR /opt/project
RUN sbt assembly

RUN cp /tmp/sbt/finch-hello-world/scala-2.11/finch-hello-world-assembly-1.0.jar ./hw.jar

CMD java -Dport=$PORT -jar hw.jar

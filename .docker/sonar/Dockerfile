FROM sonarqube:6.4-alpine

MAINTAINER Kaj Nelissen

ENV SONARQUBE_HOME /opt/sonarqube
ENV SONAR_PLUGIN_HOME $SONARQUBE_HOME/extensions/plugins

RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/curl"]

RUN set -x && curl -o ${SONAR_PLUGIN_HOME}/sonar-php-plugin-3.2.0.4868.jar -fSL https://binaries.sonarsource.com/Distribution/sonar-php-plugin/sonar-php-plugin-3.2.0.4868.jar
RUN set -x && curl -o ${SONAR_PLUGIN_HOME}/sonar-javascript-plugin-5.2.1.7778.jar -fSL https://binaries.sonarsource.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-5.2.1.7778.jar

RUN curl --insecure -OL https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip
RUN unzip sonar-scanner-cli-4.0.0.1744-linux.zip
RUN rm sonar-scanner-cli-4.0.0.1744-linux.zip

ENV SONAR_RUNNER_HOME=/root/sonar-scanner-cli-4.0.0.1744-linux
ENV PATH $PATH:/root/sonar-scanner-cli-4.0.0.1744-linux/bin

#   ensure Sonar uses the provided Java for musl instead of a borked glibc one
RUN sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /root/sonar-scanner-cli-4.0.0.1744-linux/bin/sonar-scanner

# Use bash if you want to run the environment from inside the shell, otherwise use the command that actually runs the underlying stuff
#CMD /bin/bash
#CMD sonar-scanner -Dsonar.projectBaseDir=./src
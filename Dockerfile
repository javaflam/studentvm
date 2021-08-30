FROM fedora:latest
ADD ./oc.tar /usr/local/bin/
ADD ./apache-maven-3.6.3-bin.tar.gz /opt
RUN dnf -y update && dnf -y install jq git iproute java-11-openjdk-devel.x86_64 && dnf clean all && ln -s /opt/apache-maven-3.6.3 /opt/maven
COPY ./maven.sh /etc/profile.d/
COPY ./settings.xml /root/.m2/
CMD "/bin/bash"
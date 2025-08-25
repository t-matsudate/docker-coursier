FROM eclipse-temurin:21-jdk

ENV SCALA_VERSION=3.7.2
ENV SBT_VERSION=1.11.5
ENV PATH=/root/.local/share/coursier/bin:$PATH

WORKDIR /root
RUN apt update -y
RUN apt install -y wget gzip
RUN wget https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz
RUN gzip -d cs-x86_64-pc-linux.gz
RUN mv cs-x86_64-pc-linux cs
RUN chmod +x cs
RUN ./cs setup -y
RUN ./cs install scala:$SCALA_VERSION scalac:$SCALA_VERSION sbt:$SBT_VERSION
RUN scalac -version && sbt --version

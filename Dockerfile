FROM eclipse-temurin:21-jdk

ENV SCALA_VERSION=3.6.3
ENV SBT_VERSION=1.10.7
ENV SCALAFMT_VERSION=3.8.6
ENV SCALAFIX_VERSION=0.14.0

RUN apt update -y && apt install -y curl gzip
RUN curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup
RUN ./cs install scala:$SCALA_VERSION scalac:$SCALA_VERSION sbt:$SBT_VERSION scalafmt:$SCALAFMT_VERSION scalafix:$SCALAFIX_VERSION
RUN scalac --version && sbt --version

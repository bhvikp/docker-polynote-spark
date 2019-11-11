FROM openjdk:8-slim-buster

ENV SPARK_HOME="/opt/spark"
ENV HOME /root

WORKDIR ${HOME}

RUN apt update -y && \
    apt install -y wget zip python3 python3-dev python3-pip build-essential && \
    pip3 install jep jedi virtualenv

COPY binaries/polynote-dist.tar.gz .
RUN wget http://apachemirror.wuchna.com/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz
COPY libs/*.zip .
RUN unzip s3libs.zip && rm -f s3libs.zip

RUN tar xzf polynote-dist.tar.gz && tar xzf spark-2.4.4-bin-hadoop2.7.tgz
RUN mv polynote /opt/polynote && mv spark-2.4.4-bin-hadoop2.7 /opt/spark
RUN rm -f polynote-dist.tar.gz spark-2.4.4-bin-hadoop2.7.tgz

COPY config/config.yml /opt/polynote/config/
COPY config/spark-defaults.conf /opt/spark/conf/

ENV PATH="$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin"
ENV PYSPARK_PYTHON=python3

EXPOSE 8192

ENTRYPOINT ["/opt/polynote/polynote"]
CMD [ "--config", "/opt/polynote/config/config.yml" ]
FROM bde2020/spark-master:2.4.4-hadoop2.7

ENV SPARK_HOME /spark

RUN apk --no-cache add procps && \ 
    mkdir /livy && \
    cd /livy && \ 
    wget http://mirrors.estointernet.in/apache/incubator/livy/0.6.0-incubating/apache-livy-0.6.0-incubating-bin.zip && \
    unzip apache-livy-0.6.0-incubating-bin.zip 

ADD start.sh /

CMD ["sh", "/start.sh"]
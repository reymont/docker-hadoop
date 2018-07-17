FROM bde2020/hadoop-base:1.1.0-hadoop2.7.1-java8
MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:50070/ || exit 1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

RUN curl -o /opt/pig-0.17.0.tar.gz --create-dirs http://mirror.bit.edu.cn/apache/pig/latest/pig-0.17.0.tar.gz
RUN tar -xzf /opt/pig-0.17.0.tar.gz && \
      export PIG_INSTALL=/opt/pig-0.17.0 && \
      export PATH=$PATH:$PIG_INSTALL/bin && \
      export HADOOP_HOME=/opt/hadoop-2.7.1 && \
      export PIG_CLASSPATH=$HADOOP_HOME/etc/hadoop

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 50070

CMD ["/run.sh"]
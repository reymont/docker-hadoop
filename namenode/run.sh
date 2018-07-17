#!/bin/bash
export PIG_INSTALL=/opt/pig-0.17.0 && \
export PATH=$PATH:$PIG_INSTALL/bin && \
export HADOOP_HOME=/opt/hadoop-2.7.1 && \
export PIG_CLASSPATH=$HADOOP_HOME/etc/hadoop

namedir=`echo $HDFS_CONF_dfs_namenode_name_dir | perl -pe 's#file://##'`
if [ ! -d $namedir ]; then
  echo "Namenode name directory not found: $namedir"
  exit 2
fi

if [ -z "$CLUSTER_NAME" ]; then
  echo "Cluster name not specified"
  exit 2
fi

if [ "`ls -A $namedir`" == "" ]; then
  echo "Formatting namenode name directory: $namedir"
  $HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode -format $CLUSTER_NAME 
fi

$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode

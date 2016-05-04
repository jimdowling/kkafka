include_attribute "kafka"
include_attribute "flink"
include_attribute "hadoop_spark"
include_attribute "apache_hadoop"
include_attribute "kzookeeper"

default[:kafka][:user] = "kafka"
default[:kafka][:group] = "kafka"


default[:kkafka][:offset_monitor][:version] = "0.2.1"
default[:kkafka][:offset_monitor][:url]     = "http://snurran.sics.se/hops/KafkaOffsetMonitor-assembly-" + node[:kkafka][:offset_monitor][:version] + ".jar"
default[:kkafka][:offset_monitor][:port]    = "11111"

default[:kkafka][:partitions]               = "4"

node.normal.kafka.version = "0.8.2.2"
node.normal.kafka.checksum = "6e75bb0e0438960aa668d0f9d570009647e457d74c377e4bbc508cec43ecf639"
node.normal.kafka.md5_checksum = "77e4fba83e8b5e8a2d63785980fde393"

node.normal.kafka.partitions = 2

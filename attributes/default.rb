include_attribute "kafka"
include_attribute "flink"
include_attribute "spark"
include_attribute "hadoop"

default[:kafka][:user] = "kafka"
default[:kafka][:group] = "kafka"


default[:kafka][:offset_monitor][:version] = "0.2.1"
default[:kafka][:offset_monitor][:url] = "http://snurran.sics.se/hops/KafkaOffsetMonitor-assembly-" + node[:kafka][:offset_monitor][:version] + ".jar"

node.normal.kafka.version = "0.8.2.2"
node.normal.kafka.checksum = "6e75bb0e0438960aa668d0f9d570009647e457d74c377e4bbc508cec43ecf639"
node.normal.kafka.md5_checksum = "77e4fba83e8b5e8a2d63785980fde393"

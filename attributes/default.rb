include_attribute "kafka"
include_attribute "flink"
include_attribute "spark"
include_attribute "hadoop"

default[:kafka][:user] = "kafka"
default[:kafka][:group] = "kafka"


default[:kafka][:offset_monitor][:version] = "0.2.1"
default[:kafka][:offset_monitor][:url] = "http://snurran.sics.se/hops/KafkaOffsetMonitor-assembly-" + node[:kafka][:offset_monitor][:version] + ".jar"

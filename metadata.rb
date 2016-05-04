name             "kkafka"
maintainer       "kafka"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      'Installs/Configures/Runs kkafka'
version          "0.1.0"

recipe            "kkafka::install", "Experiment setup for kkafka"
recipe            "kkafka::default", "configFile=; Run experiment for Kafka"
recipe            "kkafka::monitor", "Helper webapp to monitor performance of kafka"
recipe            "kkafka::client", "Kafka client installation"

depends "kagent"
#depends "kafka"
depends "kzookeeper"
depends "java"

%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end

attribute "kafka/ulimit",
:description => "ULimit for the max number of open files allowed",
:type => 'string'

attribute "kkafka/offset_monitor/port",
:description => "Port for Kafka monitor service",
:type => 'string'

name             'kkafka'
maintainer       "kafka"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      'Installs/Configures/Runs kkafka'
version          "0.1"

recipe            "kkafka::install", "Experiment setup for kkafka"
recipe            "kkafka::default", "configFile=; Run experiment for Kafka"
recipe            "kkafka::kafkat", "Helper tool for managing kafka"

depends "kafka"
depends "zookeeper"
depends "kzookeeper"

%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end

attribute "kafka/ulimit",
:description => "ULimit for the max number of open files allowed",
:type => 'string'


name             'kkafka'
maintainer       "kafka"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      'Installs/Configures/Runs kkafka'
version          "0.1"

recipe            "kkafka::install", "Experiment setup for kkafka"
recipe            "kkafka::default", "configFile=; Run experiment for Kafka"

depends "kagent"
depends "kafka"
depends "zookeeper"
depends "kzookeeper"

%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end

attribute "kkafka/version",
:description => "Version of kkafka",
:type => 'string',
:default => "0.1"


attribute "kkafka/user",
:description => "Run kkafka as this user",
:type => 'string',
:default => "kkafka"



name             'kkafka'
maintainer       "kafka"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      'Installs/Configures/Runs kkafka'
version          "0.1"

recipe            "kkafka::install", "Experiment setup for kkafka"




%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end

attribute "kkafka/version",
:description => "Version of kkafka",
:type => 'string',
:default => "0.1"


attribute "kkafka/url",
:description => "Url to download binaries for kkafka",
:type => 'string',
:default => ""

attribute "kkafka/user",
:description => "Run kkafka as this user",
:type => 'string',
:default => "kkafka"



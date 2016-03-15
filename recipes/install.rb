include_recipe 'kkafka::_id'

include_recipe "java"

node.default.kafka.broker[:log_dirs] = %w[/tmp/kafka-logs]

include_recipe 'kafka::_defaults'
include_recipe 'kafka::_setup'
include_recipe 'kafka::_install'

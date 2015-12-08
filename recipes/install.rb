include_recipe 'kkafka::_id'

node.default['java']['jdk_version'] = 8
include_recipe "java"

node.default.kafka.broker[:log_dirs] = %w[/tmp/kafka-logs]

include_recipe 'kafka::_defaults'
include_recipe 'kafka::_setup'
include_recipe 'kafka::_install'

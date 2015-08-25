
include_recipe '_id'
#node.normal[:kafka][:broker][:zookeeper_connection_timeout_ms]=60_000


node.normal.kafka.broker.zookeeper_connection_timeout_ms = 60_000

node.default.kafka.broker.zookeeper.connect = private_recipe_ip("kzookeeper","default") + ":2181"
  #"#{node[:kzookeeper][:default][:private_ips][0]}:2181"
node.normal.kafka.automatic_start=true
node.normal.kafka.automatic_restart=true

node.default.kafka.broker.hostname = private_recipe_ip("kkafka","default")

Chef::Log.info "Zookeeper: #{node.kafka.broker.zookeeper.connect}"

include_recipe 'kafka::_defaults'
#include_recipe 'kafka::_configure'
include_recipe '_configure'
include_recipe 'kafka::_coordinate'

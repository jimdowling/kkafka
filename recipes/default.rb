
include_recipe '_id'
#node.override[:kafka][:broker][:zookeeper_connection_timeout_ms]=60_000

node.override.kafka.default.private_ips = []
node.override.kafka.default.private_ips[0] = node.override.kkafka.default.private_ips[0]

node.override.kafka.broker.zookeeper_connection_timeout_ms = 60_000

node.override.kafka.broker.zookeeper.connect = private_recipe_ip("kzookeeper","default") + ":2181"
node.override.kafka.automatic_start=true
node.override.kafka.automatic_restart=true

node.override.kafka.broker.hostname = private_recipe_ip("kkafka","default")

Chef::Log.info "Zookeeper: #{node.kafka.broker.zookeeper.connect}"

include_recipe 'kafka::_defaults'
include_recipe 'kafka::_configure'
include_recipe 'kafka::_coordinate'


#node.normal[:kafka][:broker][:zookeeper_connection_timeout_ms]=60_000


node.normal.kafka.broker.zookeeper_connection_timeout_ms = 60_000

node.default.kafka.broker.zookeeper.connect = "#{node[:kzookeeper][:default][:private_ips][0]}:2181"
node.normal.kafka.automatic_start=true
node.normal.kafka.automatic_restart=true

Chef::Log.info "Zookeeper: #{node.kafka.broker.zookeeper.connect}"

include_recipe 'kafka::_defaults'
include_recipe 'kafka::_configure'


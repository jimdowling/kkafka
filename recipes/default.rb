
include_recipe 'kkafka::_id'
#node.override[:kafka][:broker][:zookeeper_connection_timeout_ms]=60_000

#node.override.kafka.default.private_ips = []
# node.override.kafka.default.private_ips[0] = private_recipe_ip("kkafka","default")

node.override.kafka.broker.zookeeper_connection_timeout_ms = 60_000

node.override.kafka.broker.zookeeper.connect = private_recipe_ip("kzookeeper","default") + ":2181"
node.override.kafka.automatic_start=true
node.override.kafka.automatic_restart=true

node.override.kafka.broker.hostname = private_recipe_ip("kkafka","default")

node.override.kafka.version = '0.8.2.2'

#
# Base URL for Kafka releases. The recipes will a download URL using the
# `base_url`, `version` and `scala_version` attributes.
node.override.kafka.base_url = 'https://archive.apache.org/dist/kafka'

# SHA-256 checksum of the archive to download, used by Chef's `remote_file  resource.
node.override.kafka.checksum = '6e75bb0e0438960aa668d0f9d570009647e457d74c377e4bbc508cec43ecf639'
node.override.kafka.md5_checksum = '77e4fba83e8b5e8a2d63785980fde393'
node.override.kafka.scala_version = '2.9.2'


node.normal.kafka.broker.zookeeper_connection_timeout_ms = 60_000
node.normal.kafka.broker.zookeeper.connect = private_recipe_ip("kzookeeper","default") + ":2181"
node.normal.kafka.automatic_start=true
node.normal.kafka.automatic_restart=true

node.normal.kafka.broker.hostname = private_recipe_ip("kkafka","default")

Chef::Log.info "Zookeeper: #{node.kafka.broker.zookeeper.connect}"

include_recipe 'kafka::_defaults'
include_recipe 'kafka::_configure'
include_recipe 'kafka::_coordinate'



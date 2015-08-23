# user node[:kafka][:user] do
#   action :create
#   supports :manage_home => true
#   home "/home/#{node[:kafka][:user]}"
#   shell "/bin/bash"
#   not_if "getent passwd #{node[:kafka]['user']}"
# end

# group node[:kafka][:group] do
#   action :modify
#   members ["#{node[:kafka][:user]}"]
#   append true
# end

node.default.kafka.broker[:log_dirs] = %w[/tmp/kafka-logs]


include_recipe 'kafka::_defaults'
include_recipe 'kafka::_setup'
include_recipe 'kafka::_install'


monitordir = "/srv/kafka-monitor"
directory monitordir do
  owner node[:kzookeeper][:user]
  group node[:kafka][:group]
  mode "0774"
  recursive true
  action :create
  not_if { File.directory?("#{monitordir}") }
end

url = node[:kkafka][:offset_monitor][:url]
base_filename = File.basename(url)
dest="#{monitordir}/#{base_filename}"

remote_file dest do
  source url
  owner node[:kzookeeper][:user]
  group node[:kafka][:group]
  mode "0775"
  action :create_if_missing
end

#zk_ips = node[:kzookeeper][:default][:private_ips].join(",")
zk_ips = private_recipe_ip("kkafka","default")
kkafka_monitor "kafka-monitor" do
 jar_file File.basename(node[:kkafka][:offset_monitor][:url])
 zk_ips zk_ips
 action :start
end

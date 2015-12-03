action :start do


jars = "#{new_resource.jar_files}"
zk_ips = "#{new_resource.zk_ips}"
graphite_ip = "#{new_resource.graphite_ip}"
# zk-server1,zk-server2 \

  bash "start-#{new_resource.name}" do
    user node[:ndb][:user]
    code <<-EOF
    cd /srv/kafka-monitor
    nohup java -cp #{jars} \
     com.quantifind.kafka.offsetapp.OffsetGetterWeb \
     --zk "#{zk_ips}" \
     --port 8080 \
     --refresh 10.seconds \
     --retain 2.days \
     --pluginsArgs graphiteHost=#{graphite_ip},graphitePort=2003,graphitePrefix=stats.kafka.offset_monitor \
     & > /srv/kafka-monitor/monitor.log
  echo $! > monitor.pid   
  EOF
  end
  new_resource.updated_by_last_action(true)
end

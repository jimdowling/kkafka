kafka_ip = private_recipe_ip("kkafka", "default")
found_id=-1
id=1
my_ip = my_private_ip()

for kafka in node[:kzookeeper][:default][:private_ips]
  if my_ip.eql? kafka
    Chef::Log.info "Found matching IP address in the list of kafka nodes: #{kafka}. ID= #{id}"
    found_id = id
  end
  id += 1
end 
Chef::Log.info "Found ID IS: #{found_id}"
if found_id == -1
  raise "Could not find matching IP address #{my_ip} in the list of kafka nodes: " + node[:kzookeeper][:default][:private_ips].join(",")
end

node.default.kafka.broker.broker_id = found_id
node.default.kafka.broker.id = found_id

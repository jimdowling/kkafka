

template "/etc/kafkacfg" do
    source "kafkacfg.erb"
    owner node[:kafka][:user]
    group node[:kafka][:group]
    mode 0655
    variables({
                :kafka_dir => found_id,
                :kafka_logs_dir => found_id,
                :zk_path => found_id,                
              })
end

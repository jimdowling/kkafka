actions :start

attribute :jar_file, :kind_of => String
attribute :zk_ips, :kind_of => String
attribute :graphite_ip, :kind_of => String

def initialize( *args )
  super
end

default_action :start

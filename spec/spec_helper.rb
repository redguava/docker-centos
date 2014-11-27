require 'serverspec'
require 'docker'

set :backend, :docker
set :docker_image, 'redguava/centos'

# Default is 60s
Excon.defaults[:write_timeout] = 1000
Excon.defaults[:read_timeout]  = 1000

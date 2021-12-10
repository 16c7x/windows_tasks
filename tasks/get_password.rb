#!/opt/puppetlabs/puppet/bin/ruby
require 'json'
require 'open3'
$params = JSON.parse(STDIN.read)
cmd="/opt/puppetlabs/bin/puppet lookup --render-as s " + $params['hierakey'] + " --environment=" + $params['environment']
stdout,stderr,status = Open3.capture3(cmd)
STDERR.puts stderr
if status.success?
   password = stdout
else
  STDERR.puts "Error"
end

result = { _sensitive: password }
puts result.to_json
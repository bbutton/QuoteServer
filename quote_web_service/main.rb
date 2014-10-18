require 'json'
require 'sinatra'
require 'redis'
require 'ohm'

configure do
  url = 'http://127.0.0.1:6379'

  json = ENV['VCAP_SERVICES']
  if( json != nil)
    puts "json is #{json}"
    vcap = JSON.parse(json)
    credentials = vcap["user-provided"][0]["credentials"]
    host = credentials["host"]
    port = credentials["port"]
    
    url = "redis://#{host}:#{port}"
  end

  puts "VCAP_SERVICES is #{url}"
  Ohm.redis = Redic.new(url)
end

require './models/init'
require './helpers/init'
require './routes/init'


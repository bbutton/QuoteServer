# encoding: UTF-8
require 'json'
require 'sinatra'
require 'mongo'
require 'mongo_mapper'

configure do
  url = 'mongodb://localhost:27017'

  json = ENV['VCAP_SERVICES']
  if( json != nil)
    vcap = JSON.parse(json)
    url = vcap["mongodb-2.2"][0]["credentials"]["url"]
  end

  puts "Mongo_URI is " + url
  MongoMapper.connection = Mongo::MongoClient.from_uri(url)
  MongoMapper.database = "db"
end

require './models/init'
require './helpers/init'
require './routes/init'


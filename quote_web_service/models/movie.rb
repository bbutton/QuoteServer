# encoding: UTF-8
require 'mongo_mapper'

class Movie
  include MongoMapper::Document

  key :title,            String
  key :quote,            String
end

# encoding: UTF-8
require 'redis'
require 'ohm'

class Movie < Ohm::Model
  attribute :title
  attribute :quote
end

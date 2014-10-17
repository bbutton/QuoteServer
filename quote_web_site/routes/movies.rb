# encoding: UTF-8
require_relative "../models/movie"
require 'json'

get '/' do
  @movies = Movie.all.to_a

  erb :index
end

post '/addMovie' do
  title = params[:title]
  quote = params[:quote]

  movie = Movie.create title: title, quote: quote
  movie.save
  
  @movies = Movie.all

  status 200

  redirect "/"
end

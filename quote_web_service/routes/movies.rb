# encoding: UTF-8
require_relative "../models/movie"

get '/api/movies' do
  movies = Movie.all.to_a

  format_response(movies, request.accept)
end

post '/api/movies' do
  body = JSON.parse request.body.read
  movie = Movie.create(
    title:    body['title'],
    quote:    body['quote']
  )
  movie.save

  status 201
  format_response(movie, request.accept)
end


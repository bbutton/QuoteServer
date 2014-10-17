# encoding: UTF-8
require_relative "../models/movie"

get '/api/movies' do
  if(Movie == nil) then movies = "EMPTY" end
  movies = Movie.all

  format_response(movies, request.accept)
  #format_response(Movie.all, request.accept)
end

get '/api/movies/:id' do
  movie ||= Movie.find(params[:id]) || halt(404)
  format_response(movie, request.accept)
end

post '/api/movies' do
  body = JSON.parse request.body.read
  movie = Movie.create(
    title:    body['title'],
    quote:    body['quote']
  )
  status 201
  format_response(movie, request.accept)
end

put '/api/movies/:id' do
  body = JSON.parse request.body.read
  movie ||= Movie.find(params[:id]) || halt(404)
  halt 500 unless movie.set(
    title:    body['title'],
    director: body['quote']
  )
  format_response(movie, request.accept)
end

delete '/api/movies/:id' do
  movie ||= Movie.find(params[:id]) || halt(404)
  halt 500 unless movie.destroy
end

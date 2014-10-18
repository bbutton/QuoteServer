# encoding: UTF-8
require_relative "../models/movie"

get '/api/movies' do
  movies = Movie.all.to_a.map { |m| "#{m.title}:#{m.quote}" }

  format_response(movies, request.accept)
end

post '/api/movies' do
  body = JSON.parse request.body.read
  title = body['title']
  quote = body['quote']
  puts "body = #{body}"
  puts "title: #{title}, quote: #{quote}"

  movie = Movie.create title: title, quote: quote
  movie.save

  status 201
  format_response("#{movie.title}:#{movie.quote}", request.accept)
end


require 'sinatra'
require_relative 'models/fruit'
require_relative 'services/fruit_service'

set public_folder: 'static'

fruits = FruitService.new

get '/' do
  fruits.load!
  @fruits = fruits.sort_by_title
  erb :index
end

get '/red.erb' do
  fruits.load!
  @fruits = fruits.sort_by_title
  erb :red
end

get '/csv' do
  content_type 'application/csv'
  attachment 'fruits.csv'
  fruits.to_csv
end
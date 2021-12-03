require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/birthday.rb'


class BirthdayApp < Sinatra::Base
  enable :sessions

  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  post '/details' do
    $birthday = Birthday.new(params[:day], params[:month])
    if $birthday.valid? == false
      redirect '/invalid'
    end
  end

  get '/invalid' do
    erb(:invalid)
  end

  run! if app_file == $0
end
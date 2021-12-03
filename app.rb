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
    $birthday = Birthday.new(params[:name], params[:day].to_i, params[:month].to_i)
    if $birthday.valid? == false
      redirect '/invalid'
    elsif $birthday.birthday?
      redirect '/birthday'
    end
  end

  get '/invalid' do
    erb(:invalid)
  end
  
  get '/birthday' do
    @name = $birthday.name
    erb(:birthday)
  end

  run! if app_file == $0
end
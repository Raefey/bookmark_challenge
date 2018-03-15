require 'sinatra/base'
require_relative './link.rb'
require_relative './database_connection_setup.rb'

class Bookmarks < Sinatra::Base

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/add' do
    erb :add, :locals => {:invalid_link => false}
  end

  post '/new-link' do
    url = params['url']
    if Link.create(url: url)
      redirect('/')
    else
      erb :add, :locals => {:invalid_link => true}
    end
  end

  run! if app_file == $0
end

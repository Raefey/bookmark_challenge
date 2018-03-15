require 'sinatra/base'
require_relative './link.rb'
require_relative './database_connection_setup.rb'

class Bookmarks < Sinatra::Base

  get '/' do
    @links = Link.all
    erb :index, :locals => {:invalid_link => false}
  end

  post '/new-link' do
    if Link.create(url: params['new_link'])
      redirect('/')
    else
      erb :index, :locals => {:invalid_link => true}
    end
  end

  run! if app_file == $0
end

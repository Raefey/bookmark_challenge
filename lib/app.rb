require 'sinatra/base'
require_relative './link.rb'
require_relative './database_connection_setup.rb'

class Bookmarks < Sinatra::Base

  get '/' do
    @links = Link.all
    erb(:index)
  end

  get '/add' do
    erb(:add)
  end

  post '/new-link' do
    url = params['url']
    Link.create(url: url)
    redirect('/')
  end


  run! if app_file == $0
end

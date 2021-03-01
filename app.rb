require 'sinatra/base'
require './lib/bookmark.rb'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  before do
    @bookmark_list = Bookmark.all
  end

    get '/' do
        erb :index
    end

    get '/bookmarks' do
      erb :bookmarks
    end

    get '/users/new' do
      erb :"users/new"
    end

    post '/users' do
      # create user
      redirect '/bookmarks'
    end

    patch '/update_bookmark/:id' do
      Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
      redirect '/bookmarks'
    end

    post '/add_bookmark' do
      p params
      flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params[:url], title: params[:title])
      redirect '/'
    end

    delete '/bookmark/:id' do
      p params
      Bookmark.delete(id: params[:id])
      redirect '/bookmarks'
    end

    # patch '/articles/:id' do #update the article

    # end

    run! if app_file == $0
end

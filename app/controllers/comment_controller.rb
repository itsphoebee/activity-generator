class CommentController < ApplicationController

  get '/activities/:slug/comments' do
    erb :'comments/show'
  end

  get '/activities/:slug/comments/new' do
    erb :'comments/new'
  end

  post '/activities/:slug' do

  end
end

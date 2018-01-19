require 'pry'
class UserController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/activities'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect '/activities'
    else
      redirect '/error'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/activities'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(email:params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/activities'
    else
      redirect '/login'
    end
  end

  get '/users/:slug' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      erb :'users/show'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/'
    else
      redirect '/login'
    end
  end
end

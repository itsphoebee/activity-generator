require './config/environment'
require 'pry'

class ActivityController < ApplicationController

  get '/activities' do
    if logged_in?
      @user = current_user
      @random_activity = Activity.all.sample
      erb :'activities/index'
    else
      redirect '/login'
    end
  end

  get '/activities/new' do
    if logged_in?
      @categories = Category.all
      erb :'activities/new'
    else
      redirect '/login'
    end
  end

  post '/activities/new' do

  end

  get '/activities/:slug' do
    if logged_in?
      @activity = Activity.find_by_slug(params[:slug])
      erb :'activities/show'
    else
      redirect '/login'
    end
  end

  post '/activities/:slug' do

  end

  get '/activities/:slug/edit' do
    @activity = Activity.find_by_slug(params[:slug])
    if logged_in? && @activity.user_id == session[:user_id]
      erb :'activities/edit'
    else
      redirect '/error'
    end
  end

  patch '/activities/:slug/delete' do
    @activity = Activity.find_by_slug(params[:slug])
    if @activity.user_id == session[:user_id]
      @activity.delete
    else
      redirect '/error'
    end
  end
end

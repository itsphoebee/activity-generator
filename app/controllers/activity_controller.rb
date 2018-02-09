require './config/environment'
require 'pry'

class ActivityController < ApplicationController

  get '/activities' do
    if logged_in?
      @user = current_user
      @random_activity = Activity.all.where('activities.user_id != ?', @user.id).sample
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
    @activity = Activity.new(params[:activity])
    @activity.user_id = session[:user_id]
    @activity.save
    redirect "/activities/#{@activity.slug}"
  end

  get '/activities/:slug' do
    if logged_in?
      @activity = current_activity
      erb :'activities/show'
    else
      redirect '/login'
    end
  end

  get '/activities/:slug/edit' do
    @activity = current_activity
    if logged_in? && @activity.user_id == session[:user_id]
      erb :'activities/edit'
    else
      redirect '/error'
    end
  end

  post '/activities/:slug' do
    @activity = current_activity
    if @activity.user_id == session[:user_id]
      @activity.update(params[:activity])
      @activity.save
      redirect "/activities/#{@activity.slug}"
    else
      redirect '/error'
    end

  end

  patch '/activities/:slug/delete' do
    @activity = current_activity
    if @activity.user_id == session[:user_id]
      @activity.delete
    else
      redirect '/error'
    end
  end

  private

  def current_activity
    Activity.find_by_slug(params[:slug])
  end

end

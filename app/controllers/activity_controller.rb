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

  get '/activities/:slug' do
    if logged_in?
      @activity = Activity.find_by_slug(params[:slug])
      erb :'activities/show'
    else
      redirect '/login'
    end
  end

  get '/activities/:slug/edit' do
    @activity = Activity.find_by_slug(params[:slug])
    if logged_in? && @activity.user_id == session[:user_id]
      erb :'activities/edit'
    else
      flash[:message]="You do not have permission to edit this."
      redirect '/activities/:slug'
    end
  end
end

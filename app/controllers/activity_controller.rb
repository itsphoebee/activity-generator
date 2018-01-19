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
end

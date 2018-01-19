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
end

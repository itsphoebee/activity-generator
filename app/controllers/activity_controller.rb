require './config/environment'
require 'pry'
class ActivityController < ApplicationController

  get '/activities' do
    if logged_in?
      @activity = Activity.all.sample
      binding.pry
      erb :'activities/index'
    else
      redirect '/login'
    end
  end
end

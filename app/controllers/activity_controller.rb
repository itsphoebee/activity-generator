require 'pry'
class ActivityController < ApplicationController

  get '/activities' do
    if logged_in?
      @current_user
      binding.pry
      erb :'activities/index'
    else
      redirect '/login'
    end
  end
end

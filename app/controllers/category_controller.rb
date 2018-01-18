require 'pry'
class CategoryController < ApplicationController

  get '/categories' do
    if logged_in?
      @categories = Category.all
      erb :'categories/all'
    else
      redirect '/login'
    end
  end

end


class CategoryController < ApplicationController

  get '/categories' do
    if logged_in?
      @categories = Category.all
      erb :'categories/index'
    else
      redirect '/login'
    end
  end

end

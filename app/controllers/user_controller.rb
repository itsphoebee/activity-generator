class UserController < ApplicationController
  get '/signup' do
    erb :'users/signup'
  end

  get '/login' do

  end
end

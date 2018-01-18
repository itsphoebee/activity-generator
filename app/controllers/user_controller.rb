class UserController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/activities'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect '/activities'
    else
      redirect '/error'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/activities'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(email:params[:email])
    if @user && user.authenticate(password:params[:password])
      redirect '/activities'
    else
      redirect '/error'
    end
  end

end

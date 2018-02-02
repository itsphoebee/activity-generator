class CommentController < ApplicationController

  get '/activities/:slug/comments' do
    if logged_in?
      @activity = current_activity
      erb :'/comments/show'
    else
      redirect '/login'
    end
  end

  get '/activities/:slug/comments/new' do
    if logged_in?
      @activity = current_activity
      erb :'/comments/new'
    else
      redirect '/login'
    end
  end

  post '/activities/:slug/comments' do
    @activity = current_activity
    @comment = Comment.new(content:params[:content])
    @comment.user_id = session[:user_id]
    @comment.activity_id = @activity.id
    @comment.save
    redirect "/activities/#{@activity.slug}/comments"
  end

  private

  def current_activity
    Activity.find_by_slug(params[:slug])
  end
end

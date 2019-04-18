class BlogsController < ApplicationController
  def index
    @messages = Blog.all.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @user = current_user.username
  end

  def create
    Blog.create(username:blog_params[:username],text:blog_params[:text],user_id: current_user.id)
  end

  def edit
    @messsage =Blog.find(params[:id])
  end

  def update
    bl = Blog.find(params[:id])
    if bl.user_id == current_user.id
      bl.update(blog_params)
    end
  end

  def show
  
  end

  def destroy
    bl = Blog.find(params[:id])
    bl.destroy if bl.user_id == current_user.id
  end



  private
  def blog_params
    params.permit(:username, :text)
  end



end

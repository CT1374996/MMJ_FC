class Admin::BlogsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog__params)
    if @blog.save
      redirect_to admin_blog_path(@blog.id)
    else
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.save
      redirect_to admin_blog_path(@blog.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def blog_params
    params.require(:blog).permit(:blog_title, :blog_body)
  end
end

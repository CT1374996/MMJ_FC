class Admin::BlogsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @blogs = Blog.all
    @blogs = Blog.order(created_at: :desc)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice] = "日記を投稿しました"
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
      flash[:notice] = "日記を更新しました"
      redirect_to admin_blog_path(@blog.id)
    else
      render :edit
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    flash[:notice] = "日記を削除しました"
    redirect_to admin_blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:blog_title, :blog_body)
  end
end

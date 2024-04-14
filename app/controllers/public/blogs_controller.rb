class Public::BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    @blogs = Blog.order(created_at: :desc)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private
  def blog_params
    params.require(:blog).permit(:blog_title, :blog_body)
  end
end

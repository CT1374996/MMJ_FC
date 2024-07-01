class Admin::GoodsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @goods = Good.all
    @goods = Good.order(created_at: :desc)
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(good_params)
    if @good.save
      flash[:notice] = "グッズの詳細ページが投稿されました"
      redirect_to admin_good_path(@good.id)
    else
      render :new
    end
  end

  def show
    @good = Good.find(params[:id])
  end

  def edit
    @good = Good.find(params[:id])
  end

  def update
    @good = Good.find(params[:id])
    if @good.update
      flash[:notice] = "グッズの詳細ページの変更が完了しました"
      redirect_to admin_good_path(@good.id)
    else
      render :edit
    end
  end

  def destroy
    good = Good.find(params[:id])
    good.destroy
    flash[:notice] = "グッズの詳細ページを削除しました"
    redirect_to admin_goods_path
  end

  private
  def good_params
    params.require(:good).permit(:goods_name, :goods_info, :price)
  end

end

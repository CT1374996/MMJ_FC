class Public::GoodsController < ApplicationController
  def index
    @goods = Good.all
    @goods = Good.order(created_at: :desc)
  end

  def show
    @good = Good.find(params[:id])
  end
end

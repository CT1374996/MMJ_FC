class Public::InformationController < ApplicationController
  def index
    @information = Information.all
    @information = Information.order(created_at: :desc)
  end

  def show
    @information = Information.find(params[:id])
  end

  private
end

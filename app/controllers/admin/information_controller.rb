class Admin::InformationController < ApplicationController
  before_action :authenticate_admin!
  def index
    @information = Information.all
    @information = Information.order(created_at: :desc)
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      flash[:notice] = "お知らせを投稿しました"
      redirect_to admin_information_path(@information.id)
    else
      render :new
    end
  end

  def show
    @information = Information.find(params[:id])
  end

  def edit
    @information = Information.find(params[:id])
  end

  def update
    @information = Information.find(params[:id])
    if @information.update(information_params)
      flash[:notice] = "お知らせを更新しました"
      redirect_to admin_information_path(@information.id)
    else
      render :edit
    end
  end

  def destroy
    information = Information.find(params[:id])
    information.destroy
    flash[:notice] = "お知らせを削除しました"
    redirect_to admin_information_index_path
  end

  private
  def information_params
    params.require(:information).permit(:info_title, :info_body)
  end
end

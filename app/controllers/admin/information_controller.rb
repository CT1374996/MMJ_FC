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
    if @information.update
      redirect_to admin_information_path(@information.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def information_params
    params.require(:information).permit(:info_title, :info_body)
  end
end

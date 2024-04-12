class Admin::InformationController < ApplicationController
  def index
    @information = Information.all
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
    if @information = Information.update(params[:id])
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

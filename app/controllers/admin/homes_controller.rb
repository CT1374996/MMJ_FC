class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @information = Information.new
    @blog = Blog.new
  end
end

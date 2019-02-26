class DashboardsController < ApplicationController
  def index
    @athletes = User.all.page params[:page]
  end
end

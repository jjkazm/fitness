class DashboardsController < ApplicationController
  def index
    @athletes = User.all.page params[:page]
  end

  def search
    @athletes = User.search_by_name(params[:search_name]).paginate(page: params[:page])
  end
end

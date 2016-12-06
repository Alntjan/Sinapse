class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @entries = @user.project_entries
    @entries = @entries.type(params[:type]) if params[:type].present?
    @projects = @user.projects
  end
end

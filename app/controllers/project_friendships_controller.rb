class ProjectFriendshipsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]

  def new
    if params[:project_id]
      @project = Project.find(params[:project_id])
      @project_friendship = current_user.project_friendships.new(project: @project)
    else
      flash[:error] = "Project Required"
    end
  end

  def create
    if params[:project_friendship] && params[:project_friendship].has_key?(:project_id)
      @project = Project.find(params[:project_friendship][:project_id])
      @project_friendship = current_user.project_friendships.new(project: @project)
      @project_friendship.save
      flash[:success] = "Amizade Criada"
      redirect_to project_path(@project)
    else
      flash[:error] = "Project Required"
      redirect_to root_path
    end
  end
end

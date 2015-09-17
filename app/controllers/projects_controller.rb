class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def home
    @projects = Project.all
    @ideas = Idea.all
    @appliances = Appliance.all
    @resources = Resource.all
    @users = User.all
  end
  def show
    @project = Project.find(params[:id])
    @entries = @project.project_entries
    @entries = @entries.type(params[:type]) if params[:type].present?
  end
  def create
    p = Project.create(params.require(:project).permit(:title, :about))
    redirect_to project_path(p)
  end
  def delete
    Project.delete(params[:id])
  end
end

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
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
    @project = Project.create(project_params)
    if @project.save
      redirect_to @project,
        notice: "Projecto criado com sucesso!"
    else
      render 'new'
    end
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :about)
  end
end

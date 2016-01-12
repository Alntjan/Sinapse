class ResourcesController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @resource = @project.resources.build(resource_params)
    @resource.user_id = current_user.id
    if @resource.save
      flash[:success] = "Recurso submetido com sucesso!"
      redirect_to project_path(@project)
    else
      flash[:success] = "Erro!"
    end

    # p = Project.find(params[:project_id])
    # p.resources.create(resource_params)
    # redirect_to project_path(p)
  end
  def index
    @resources = Resource.all
  end

  private
  def resource_params
    params.require(:resource).permit(:name, :description, :user_id, :link, :state)
  end
end

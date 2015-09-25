class ResourcesController < ApplicationController
  def create
    p = Project.find(params[:project_id])
    p.resources.create(resource_params)
    redirect_to project_path(p)
  end
  def index
    @resources = Resource.all
  end

  private
  def resource_params
    params.require(:resource).permit(:name, :description, :user_id, :link)
  end
end

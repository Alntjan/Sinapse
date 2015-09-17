class ResourcesController < ApplicationController
  def create
    p = Project.find(params[:project_id])
    p.resources.create(params.require(:resource).permit(:name, :description, :user_id))
    redirect_to project_path(p)
  end
  def index
    @resources = Resource.all
  end
end

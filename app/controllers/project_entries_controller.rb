class ProjectEntriesController < ApplicationController
  def index
    p = Project.find(params[:project_id])
    @project_entries = p.project_entries.all
  end

  def show
    @project_entry = ProjectEntry.find(params[:id])
  end
  def create
    p = Project.find(params[:project_id])
    p.project_entries.create(params.require(:project_entry).permit(:name, :description, :type, :user_id))
    redirect_to project_path(p)
  end
end

class ProjectEntriesController < ApplicationController
  before_filter :authenticate_admin!, only: [:create]

  def index
    p = Project.find(params[:project_id])
    @project_entries = p.project_entries.all
  end

  def accept
    @project = Project.find(params[:project_id])
    @project_entry = @project.project_entries.find(params[:id])
    if @project_entry.accept!
      flash[:success] = "Selecionada!"
    else
      flash[:success] = "Erro!"
    end
    redirect_to project_path(@project)
  end

  def edit
    @project_entry = ProjectEntry.find(params[:id])
  end

  def show
    @project_entry = ProjectEntry.find(params[:id])
  end

  def create
    p = Project.find(params[:project_id])
    p.project_entries.create(project_entrie_params)
    redirect_to project_path(p)
  end

  def update
    @project_entry = ProjectEntry.find(params[:id])

    if @project_entry.update(project_entrie_params)
      redirect_to project_project_entry_path(@project_entry.project, @project_entry)
    else
      render 'edit'
    end
  end

  def destroy
    @project_entry = ProjectEntry.find(params[:id])
    @project_entry.destroy

    redirect_to project_path(@project_entry.project)
  end

  private
  def project_entrie_params
    params.require(:project_entry).permit(:name, :description, :type, :user_id, :link, :state)
  end
end

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
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
    @project_friendship = @project.project_friendships.find_by user_id: current_user
    @entries = @project.project_entries.order("created_at desc")
    @entries = @entries.type(params[:type]) if params[:type].present?
    @entries = @entries.where(state: "accepted") if params[:state].present?
    @project_pending_friendships = @project.pending_project_friendships
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

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end


  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

  def ready
    @project = Project.find(params[:id])
    if @project.ready!
      flash[:success] = "Projecto pronto para avançar! Parabéns!"
    else
      flash[:success] = "Erro!"
    end
    redirect_to project_path(@project)
  end

  private
  def project_params
    params.require(:project).permit(:title, :about, :user_id, :state, :seeks_ideas, :seeks_resources, :seeks_appliances)
  end
end

class ProjectFriendshipsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]

  def index
    p = Project.find(params[:project_id])
    @project_friendships = p.project_friendships.all
  end

  def accept
    @project = Project.find(params[:project_id])
    @project_friendship = @project.project_friendships.find(params[:id])
    if @project_friendship.accept!
      flash[:success] = "You've authorized your colleague."
    else
      flash[:success] = "Error!"
    end
    redirect_to @project
  end

  def new
    @project = Project.find(params[:project_id])
    @project_friendship = ProjectFriendship.new
    # if params[:project_id]
    #   @project = Project.find(params[:project_id])
    #   @project_friendship = current_user.project_friendships.new(project: @project)
    # else
    #   flash[:error] = "Project Required"
    # end
  end

  def create
    # @project = Project.find(params[:project_id])
    # current_user.project_friendships.create(project_friendship_params)
    # redirect_to project_path(@project)
    p = Project.find(params[:project_id])
    p.project_friendships.create(project_friendship_params)
    redirect_to project_path(p)


    # if params[:project_friendship] && params[:project_friendship].has_key?(:project_id)
    #   @project = Project.find(params[:project_friendship][:project_id])
    #   @project_friendship = current_user.project_friendships.new(project: @project)
    #   @project_friendship.save
    #   # @project_friendship = ProjectFriendship.create(project_friendship_params)
    #
    #   if @project_friendship.save
    #     flash[:success] = "Amizade Criada"
    #     redirect_to project_path(@project)
    #   else
    #     flash[:error] = "Bosta"
    #   end
    # else
    #   flash[:error] = "Project Required"
    #   redirect_to root_path
    # end
  end

  def edit
    @project = Project.find(params[:project_id])
    @project_friendship = @project.project_friendships.find(params[:id])
  end

  private
  def project_friendship_params
    params.require(:project_friendship).permit(:user_id, :state)
  end
end

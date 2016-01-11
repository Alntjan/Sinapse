class IdeasController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @idea = @project.ideas.build(idea_params)
    @idea.user_id = current_user.id
    if @idea.save
      flash[:success] = "Ideia submetida com sucesso!"
      redirect_to project_path(@project)
    else
      flash[:success] = "Erro!"
    end
    # p = Project.find(params[:project_id])
    # p.ideas.create(idea_params)
    # redirect_to project_path(p)


  end
  def index
    @ideas = Idea.all

  end
  private
  def idea_params
    params.require(:idea).permit(:name, :description, :user_id, :link, :state)
  end
end

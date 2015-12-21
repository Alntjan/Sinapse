class IdeasController < ApplicationController
  def create
    p = Project.find(params[:project_id])
    p.ideas.create(idea_params)
    redirect_to project_path(p)
  end
  def index
    @ideas = Idea.all

  end
  private
  def idea_params
    params.require(:idea).permit(:name, :description, :user_id, :link, :state)
  end
end

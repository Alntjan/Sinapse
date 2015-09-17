class IdeasController < ApplicationController
  def create
    p = Project.find(params[:project_id])
    p.ideas.create(params.require(:idea).permit(:name, :description, :user_id))
    redirect_to project_path(p)
  end
  def index
    @ideas = Idea.all
  end
end

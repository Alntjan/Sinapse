class AppliancesController < ApplicationController
  def create
    p = Project.find(params[:project_id])
    p.appliances.create(params.require(:appliance).permit(:user_id, :state))
    redirect_to project_path(p)
  end
end

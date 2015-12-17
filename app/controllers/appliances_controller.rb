class AppliancesController < ApplicationController
  def create
    p = Project.find(params[:project_id])
    p.appliances.create(params.require(:appliance).permit(:user_id, :state))
    if p.save
      flash[:success] = "Candidatura submetida!"
    else
      flash[:error] = "Já te candidatas-te a este projecto!"
    end
    redirect_to project_path(p)
  end
end

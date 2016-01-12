class AppliancesController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @appliance = @project.appliances.build(appliance_params)
    @appliance.user_id = current_user.id
    if @appliance.save
      flash[:success] = "Candidatura submetida com sucesso!"
      redirect_to project_path(@project)
    else
      flash[:success] = "Já te candidatas-te a este projecto!"
    end
  end

  private
  def appliance_params
    params.require(:resource).permit(:user_id, :state)
  end

end

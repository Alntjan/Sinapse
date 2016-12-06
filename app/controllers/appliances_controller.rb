class AppliancesController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @appliance = @project.appliances.build(appliance_params)
    @appliance.user_id = current_user.id
    if @appliance.save
      flash[:success] = "Applied successfully!"
      redirect_to project_path(@project)
    else
      flash[:success] = "You already applied for this project."
    end
  end

  private
  def appliance_params
    params.require(:appliance).permit(:user_id, :state)
  end

end

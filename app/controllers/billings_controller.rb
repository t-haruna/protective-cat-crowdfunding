class BillingsController < ApplicationController
  before_action :set_project

  def new_return1
    @billing = Billing.new
    #@billings = @project.billings.includes(:user)
  end

  def new_return2
    @billing = Billing.new
    #@billings = @project.billings.includes(:user)
  end

  def new_return3
    @billing = Billing.new
    #@billings = @project.billings.includes(:user)
  end



  def create
    @billing = Billing.create(billing_params)
    if  @billing.save
      redirect_to display_project_path(@project.id) 
    else
      render :new_return1
    end
  end

  private
  def billing_params
    params.require(:billing).permit(:count_1,:count_2,:count_3).merge(user_id: current_user.id, project_id: params[:project_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end

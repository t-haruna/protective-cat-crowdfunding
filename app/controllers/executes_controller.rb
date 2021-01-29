class ExecutesController < ApplicationController
  before_action :set_project
  before_action :set_execute, only: [:show, :edit, :update]

  def new
    @execute = Execute.new
    # @executes = @project.executes.includes(:user)
  end

  def create
    @execute = Execute.create(execute_params)
    if  @execute.save
      redirect_to project_execute_path(@project, @execute.id) 
    else
      render :new
    end
  end

  def show
    @billings= Billing.where(project_id: @project.id)
  end

  def edit
  end

  def update
    if @execute.update(execute_params)
      redirect_to project_execute_path{@execute.id}
    else
      render :edit
    end
  end

  private

  def execute_params
    params.require(:execute).permit(:execute_title,:execute_image,:execute_text).merge(user_id: current_user.id, project_id: params[:project_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_execute
    @execute = Execute.find(params[:id])
  end
  
  
end

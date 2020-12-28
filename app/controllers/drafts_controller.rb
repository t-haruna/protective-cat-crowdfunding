class DraftsController < ApplicationController
  before_action :set_project

  def new
    @draft = Draft.new
  end

  def create
    @draft = Draft.new(user_id:   current_user.id,
      project_id:  @project.id
     )

     if @draft.save
      redirect_to root_path, notice: "プロジェクトを開始しました"
    else
      render :new
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end

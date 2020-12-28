class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    if  @project.save
      redirect_to project_path(@project.id) 
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    # @billings= Billing.where(project_id: @project.id)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path{@project.id}
    else
      render :edit
    end
  end

  def mypage
  end

  def draft_display
    @drafts = Draft.all
    @drafts.each do |draft|
      @projects = Project.all
      @rets = @projects.ids.reject {|v| v== draft.project_id}
      # prijectのidの中で、draft.project_idと一致しないものをrejectメソッドで抽出
      @projects = Project.where(id:@rets)
    end
    
  end

  def posting_project
    @drafts = Draft.all
    @drafts.each do |draft|
      @projects = Project.where(id:draft.project_id)
    end
  end

  def done_project
    @drafts = Draft.all
    @drafts.each do |draft|
      @projects = Project.where(id:draft.project_id)
    end
  end

  private
  def project_params
    params.require(:project).permit(:title,:image,:text,:profile,:profile_image,:target_amount,:tarm,:return_title_1,:return_price_1,:return_image_1,:return_title_2,:return_price_2,:return_image_2,:return_title_3,:return_price_3,:return_image_3).merge(user_id: current_user.id)
  end
end

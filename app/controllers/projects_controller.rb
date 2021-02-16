class ProjectsController < ApplicationController
  require "date"
  before_action :set_project, only: [:show, :edit, :update, :display, :destroy]
  before_action :set_day, only: [:index, :show, :display, :posting_project, :done_project]
  


  def index
    @drafts = Draft.all
    @drafts.each do |draft|
      @projects = Project.where(id:draft.project_id)
      @projects.each do |project|
        @billings= Billing.where(project_id: project.id)
        total1 = @billings.sum(:count_1)
        total2 = @billings.sum(:count_2)
        total3 = @billings.sum(:count_3)
        @total = total1*project.return_price_1+total2*project.return_price_2+total3*project.return_price_3 
        @target_amount = project.target_amount
        @turm= project.tarm
      end
    end
  end

  def new
    @card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    if @card.blank?
      redirect_to confirmation_projects_path
    else
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.payjp_id)
    end
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    if  @project.save
      redirect_to project_path(@project) 
    else
      render :new
    end
  end

  def show
    
    @billings= Billing.where(project_id: @project)
  end

  def display
    @billings= Billing.where(project_id: @project.id)
    @executes= Execute.where(project_id: @project.id)
  end

  

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path{@project.id}
    else
      render :edit
    end
  end

  def mypage
  end

  def confirmation
  end

  def draft_display
    @projects = Project.where(user_id:current_user)
    @drafts = Draft.all
    @drafts.each do |draft|
      @rets = @projects.ids.reject {|v| v== draft.project_id}
      # prijectのidの中で、draft.project_idと一致しないものをrejectメソッドで抽出
      @projects = Project.where(id:@rets)
    end
    
  end

  def posting_project
    @drafts = Draft.where(user_id:current_user)
    @drafts.each do |draft|
      @projects = Project.where(id:draft.project_id )
      @projects.each do |project|
        @turm= project.tarm
      end
    end
  end

  def done_project
    @drafts = Draft.where(user_id:current_user)
    @drafts.each do |draft|
      @projects = Project.where(id:draft.project_id )
      @projects.each do |project|
        @turm= project.tarm
      end
    end
  end

  def destroy
    if @project.destroy
      redirect_to root_path 
    else
      render :show
    end
  end

  private
  def project_params
    params.require(:project).permit(:title,:image,:text,:profile,:profile_image,:target_amount,:tarm,:return_title_1,:return_price_1,:return_image_1,:return_title_2,:return_price_2,:return_image_2,:return_title_3,:return_price_3,:return_image_3).merge(user_id: current_user.id)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_day
    @today = Date.today
  end
end

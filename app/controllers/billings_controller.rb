class BillingsController < ApplicationController
  before_action :set_card,:set_project
  before_action :new_return, only: [:new_return1, :new_return2, :new_return3]
  before_action :create_return, only: [:create_return1, :create_return2, :create_return3]

  def new_return1
  end

  def create_return1
  end

  def new_return2
  end

  def create_return2
  end

  def new_return3
  end

  def create_return3
  end


  private
  def billing_params
    params.require(:billing).permit(:count_1,:count_2,:count_3).merge(user_id: current_user.id, project_id: params[:project_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def new_return
    @billing = Billing.new
    @billings = @project.billings.includes(:user)
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    if @card.blank?
      redirect_to new_card_url 
    else
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.payjp_id)
    end
  end

  def create_return
    @billing = Billing.create(billing_params)
    if  @billing.save 
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      Payjp::Charge.create(
      amount: @project.return_price_1,
      customer: @card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
      redirect_to display_project_path(@project.id) 
    end
  end


end

class BillingsController < ApplicationController
  before_action :set_card,:set_project

  def new_return1
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

  def create_return1
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

  def new_return2
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

  def create_return2
    @billing = Billing.create(billing_params)
    if  @billing.save 
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      Payjp::Charge.create(
      amount: @project.return_price_2,
      customer: @card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
      redirect_to display_project_path(@project.id) 
    end
  end

  def new_return3
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

  def create_return3
    @billing = Billing.create(billing_params)
    if  @billing.save 
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      Payjp::Charge.create(
      amount: @project.return_price_3,
      customer: @card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
      redirect_to display_project_path(@project.id) 
    end
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

end

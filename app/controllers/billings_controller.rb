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

  def test
    @billing = Billing.create(billing_params)
    
    if  @billing.save 
      # @totale = @billing.count_1*@project.return_price_1.to_s+@billing.count_2*@project.return_price_2.to_s+@billing.count_3*@project.return_price_3.to_s 
      if @billing.count_1 = 1 && @billing.count_2 = "" && @billing.count_3 = ""
        Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
        Payjp::Charge.create(
        amount: @project.return_price_1,
        customer: @card.customer_id, #顧客ID
        currency: 'jpy', #日本円
        )
        redirect_to display_project_path(@project.id) 
      elsif  @billing.count_1 = "" && @billing.count_2 = 1 && @billing.count_3 = ""
        Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
        Payjp::Charge.create(
        amount: @project.return_price_2,
        customer: @card.customer_id, #顧客ID
        currency: 'jpy', #日本円
        )
        redirect_to display_project_path(@project.id) 
      elsif  @billing.count_1 = "" && @billing.count_2 = "" && @billing.count_3 = 1
        Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
        Payjp::Charge.create(
        amount: @project.return_price_3,
        customer: @card.customer_id, #顧客ID
        currency: 'jpy', #日本円
        )
        redirect_to display_project_path(@project.id) 
      else
        redirect_to display_project_path(@project.id) 
      end
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



  # def create
   
  #   @billing = Billing.create(billing_params)
  #   @billings= Billing.where(project_id: @project.id)
  #   @total1 = @billings.sum(:count_1)
  #   @total2 = @billings.sum(:count_2)
  #   @total3 = @billings.sum(:count_3)
  #   @total = @total1*@project.return_price_1+@total2*@project.return_price_2+@total3*@project.return_price_3 

  #   if  @billing.save
  #     Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
  #     Payjp::Charge.create(
  #     amount: @total.price,
  #     customer: @card.customer_id, #顧客ID
  #     currency: 'jpy', #日本円
  #   )
  #     redirect_to display_project_path(@project.id) 
  #   else
  #     render :new_return1
  #   end
  # end

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

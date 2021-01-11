class CardsController < ApplicationController
  require "payjp"
  before_action :set_card, only: [:index, :new, :delete, :show]

  def index
  end

  def new
    # card = Card.where(user_id: current_user.id)
    redirect_to card_path(@card) if @card.present?
  end

  def pay #payjpとCardsテーブルへのcreate
    # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    
    if params['payjp-token'].blank?
      redirect_to new_card_path 
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念のためmetadataにuser_idを入れたが、なくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, payjp_id: customer.default_card)
      
      if @card.save
        redirect_to root_path
      else
        redirect_to pay_cards_path
      end
    end
  end

  def delete #PayjpとCardsテーブルからの削除（destroy）
    if @card.blank?
    else
      # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
    redirect_to cards_path
  end

  def show #Cardsのデータをpayjpに送り情報を取り出す
    if @card.blank?
      redirect_to new_card_url 
    else
      # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.payjp_id)
    end
  end

  private
  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

end

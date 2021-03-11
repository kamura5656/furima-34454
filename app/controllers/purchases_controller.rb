class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :params_find,        only: [:index,:create]
  before_action :move_to_index,      only: [:index,:create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(
      :postal_code, :first_address_id, :second_address, :third_address,
      :fourth_address, :telephone).merge(user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.price)
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end

  def params_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_params[:price],  
      card: purchase_params[:token],    
      currency: 'jpy'                
    )
  end
end

class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :contents, :category_id, :status_id, :delivery_fee_id,
      :delivery_day_id, :first_address_id, :price, :image
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

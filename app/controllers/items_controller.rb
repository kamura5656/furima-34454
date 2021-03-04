class ItemsController < ApplicationController
  before_action :params_find,        only: [:edit, :update, :show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index,      only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update 
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :contents, :category_id, :status_id, :delivery_fee_id,
      :delivery_day_id, :first_address_id, :price, :image
    ).merge(user_id: current_user.id)
  end

  def params_find
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id
  end
end

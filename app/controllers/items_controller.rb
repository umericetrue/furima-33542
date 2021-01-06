class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create(item_params)
    @item = Item.new(item_params)
    @item.valid?
    if @item.save
      redirect_to action: :index
    else
      render action: :new
    end

  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end

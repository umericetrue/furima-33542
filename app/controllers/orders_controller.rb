class OrdersController < ApplicationController
  def index
    @user_order = UserOrder.new
  end

  def create
  end
end

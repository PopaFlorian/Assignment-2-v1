class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end
  
  def myorder
  end
end

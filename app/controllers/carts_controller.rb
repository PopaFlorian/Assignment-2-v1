class CartsController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order_items = current_order.order_items
    @products = Product.all
  end
  
  def myorder
  end

  def create
    @order = current_order.order_items
    @order.update(sent:true)
    redirect_to carts_path if @order.save
  end
end

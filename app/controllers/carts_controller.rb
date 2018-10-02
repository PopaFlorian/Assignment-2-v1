class CartsController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order_items = current_order.order_items
    @products = Product.all
  end
  
  def myorder; end

  def place_order
    if current_order.sent == true
      flash[:success] = "Order complete"
      # current_order.save!
      # session[:order_id] = nil   
    end
  end

  def create
    @order = current_order
    @order.update(sent:true)
    flash[:success] = "Order complete"
    redirect_to orders_path if @order.save
  end
end

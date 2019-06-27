# carts controller
class CartsController < ApplicationController
  include SessionsHelper
  helper_method :current_order
  def index
    @orders = Order.all
  end

  def show
    @order_items = current_order.order_items
    @products = Product.all
  end

  def myorder; end

  def placeOrder
    create 
  end

  def create
    @order = current_order
    @order.update(sent: true)
    flash[:success] = 'Order complete'
    if @order.save
      flash[:success] = 'Order complete'
      redirect_to orders_path
      @order.destroy
    else
      flash[:errors] = 'Put error message here'
      render :edit
    end
  end
  
end

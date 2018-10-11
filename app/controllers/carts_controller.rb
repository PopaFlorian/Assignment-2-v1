# carts controller
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
    if current_order.sent
      flash[:success] = 'Order complete'
      current_order.save!
      session[:order_id].destroy
    else
      flash[:danger] = "Order can't be place"
    end
  end

  def create
    @order = current_order
    @order.update(sent: true)
    flash[:success] = 'Order complete'
    if @order.save
      flash[:success] = 'Order complete'
      redirect_to orders_path
    else
      flash[:errors] = 'Put error message here'
      render :edit
    end
  end
end

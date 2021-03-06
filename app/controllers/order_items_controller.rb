class OrderItemsController < ApplicationController
  def new
    @order_items = OrderItem.new
  end

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order_item.save
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
  
  private
vs
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end

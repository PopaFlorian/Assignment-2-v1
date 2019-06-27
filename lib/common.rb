module CommonStuff

  def create_order
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order_item.save
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
  
end

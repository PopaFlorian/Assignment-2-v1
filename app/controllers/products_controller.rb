class ProductsController < ApplicationController 
    def index
        @products= Product.all
        @order_item = current_order.order_items.new
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            @product.avatar.attach(params[:product][:avatar])
            redirect_to root_path
        else
            redirect_to new_product_path
        end

    end

    def show; end

    private 
        def product_params
            params.require(:product).permit(:title, :description, :price, :vegetarian)
        end
end

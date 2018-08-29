class ProductsController < ApplicationController 
    def index
    
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

    def show

    end

    private 
        def product_params
            params.require(:product).permit(:title, :description, :price, :vegetarian)
        end
    # def update
    #     @user = User.find(params[:id])
    #     avatar = params[:user][:avatar]
    #     if @user.update(user_params)
    #         if avatar
    #         @user.avatar.attach(avatar)
    #         end
    #         redirect_to @user, notice: "Your profile has been updated"
    #     else
    #         render 'edit'
    #     end
    #     end
end

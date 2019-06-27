# Static pages controller
class StaticPagesController < ApplicationController
  def index
    @products = Product.all
  end

  def home
    @order_items = OrderItem.new
    @products = if params[:type].present?
                  Product.filtered(params[:type])
                elsif sort_asc(:sort_type)
                elsif sort_desc(:sort_type)
                elsif params[:veg_type].present?
                  Product.vegetarian
                else
                  Product.all
                end
  end

  def contacts; end

  def about; end

  def sort_asc(sort_type)
    @products.order(price: :asc) if params[:sort_type] == 'Ascending'
  end

  def sort_desc(sort_type)
    @products.order(price: :desc) if params[:sort_type] == 'Descending'
  end

  def filter_price
    if params.nil?
      flash[:danger] = 'Slide Error'
    else
      slide1 = params[:slide1].to_i
      slide2 = params[:slide2].to_i
      @products = Product.filter_price(slide1, slide2)
      respond_to do |format|
        format.js
      end
    end
  end

  def help; end
end

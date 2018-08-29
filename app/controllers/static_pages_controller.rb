class StaticPagesController < ApplicationController
     
  def home
    @products = Product.all
    if !params[:type].nil?
      @products = Product.filtered(params[:type])
    elsif params[:sort_type] == "Ascending"
      @products = @products.order(price: :asc )
    elsif params[:sort_type] == "Descending"
      @products = @products.order(price: :desc )
    elsif !params[:veg_type].nil?
      @products = Product.vegetarian
    else
      @products = Product.all
    end  
  end

  def contacts
  end
  
  def about
  end

  def filter_price
    if !params.nil?
      @products = Product.filter_price(params[:slide1].to_i,params[:slide2].to_i)
      respond_to do |format|
        format.js
      end
    end
  end

  def help
  end
  
end
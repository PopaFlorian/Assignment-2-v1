class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  helper_method :current_order

  def current_order
    if !session[:order_id].nil? && !search_order.nil?
      order = Order.find(session[:order_id])
      if order.user_id != current_user.id
        create_order
        session[:order_id] = @o.id
        return @o
      else
        return order
      end
    else
      create_order
      session[:order_id] = @o.id
      return @o
    end

  end

  private
    def search_order
      Order.find_by_id(session[:order_id])
    end
    def create_order
      @o =  Order.new(user_id: current_user.id, order_status_id:1)
      @o.save!
    end

end

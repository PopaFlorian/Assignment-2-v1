class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order 

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :product_present
  validates :order_present

  before_save :finalize

  def unit_price
    if persised?
      self[:unit_price]
    else
      product.unit_price
    end
  end

  def total_price
    unit_price * quantity
  end
  
  private

  def product_present
    if product.nil?
      errors.add(:product, "is not valid is not active")
    end
  end
    
  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end
  
  def
    finalize
    sef[:unit_price] = unit_price
    sef[:total_price] = quantity * sef[:unit_price]
  end

end

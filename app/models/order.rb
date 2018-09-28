class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  before_save :update_subtotal
  accepts_nested_attributes_for :order_items



  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def total
    shipping + subtotal
  end

  def shipping
    shipping = 8
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

end

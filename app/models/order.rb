# Order model
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  before_save :update_subtotal
  accepts_nested_attributes_for :order_items

  def subtotal
    order_items.collect { |o| o.valid? ? (o.quantity * o.unit_price) : 0 }.sum
  end

  def total
    shipping + subtotal
  end

  def shipping
    10 / 100 * subtotal
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end

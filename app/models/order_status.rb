class OrderStatus < ApplicationRecord
  has_many :orders 
  
  default_scope { where(active: true) }
end

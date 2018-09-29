class AddVegetarianToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :vegetarian, :boolean
  end
end

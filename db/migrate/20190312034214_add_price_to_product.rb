class AddPriceToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price, :decimal, default: 0.0
  end
end

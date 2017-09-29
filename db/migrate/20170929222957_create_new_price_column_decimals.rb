class CreateNewPriceColumnDecimals < ActiveRecord::Migration[5.1]
  def change
    add_column(:brands, :price, :decimal)
  end
end

class CreateNewAddPriceColumnToBrands < ActiveRecord::Migration[5.1]
  def change
    add_column(:brands, :price, :decimal, :precision=>4, :scale=>2 )
  end
end

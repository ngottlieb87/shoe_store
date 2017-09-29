class CreateDropPriceColumnAgain < ActiveRecord::Migration[5.1]
  def change
    remove_column(:brands, :price, :decimal, :precision=>4, :scale=>2 )
  end
end

class AddPriceToBikes < ActiveRecord::Migration[5.2]
  def change
    add_column :bikes, :price, :integer
  end
end

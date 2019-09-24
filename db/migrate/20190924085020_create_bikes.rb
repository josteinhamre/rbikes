class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.references :user, foreign_key: true
      t.string :model
      t.string :brand
      t.integer :production_year
      t.string :color
      t.string :type
      t.text :description
      t.string :photo
      t.string :location

      t.timestamps
    end
  end
end

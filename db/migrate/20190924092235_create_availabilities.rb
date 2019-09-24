class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.date :from
      t.date :to
      t.references :bike, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end

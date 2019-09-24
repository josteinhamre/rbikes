class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :bikes, :type, :bike_type
  end
end

class AddColumnToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :latitude, :float
    add_column :items, :longtitude, :float
  end
end

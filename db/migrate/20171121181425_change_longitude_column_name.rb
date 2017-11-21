class ChangeLongitudeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :longtitude, :longitude
  end
end

class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :item_name
      t.date :deadline
      t.string :brand
      t.string :note
      t.string :shop
    end
  end
end

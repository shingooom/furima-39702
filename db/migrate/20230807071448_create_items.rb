class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :category_id, null: false
      t.integer :ship_fee_id, null: false
      t.integer :region_id, null: false
      t.integer :ship_day_id, null: false
      t.integer :status_id, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
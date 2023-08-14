class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :purchase, null: false, foreign_key: true
      t.string :postcode, null: false
      t.integer :region_id, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :building
      t.string :phone, null: false

      t.timestamps
    end
  end
end

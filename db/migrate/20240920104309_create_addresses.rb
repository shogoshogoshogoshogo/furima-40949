class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.integer :region_id, null:false
      t.string :city, null: false
      t.string :street, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end

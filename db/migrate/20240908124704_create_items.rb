class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      belongs_to :user
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.
      t.timestamps
    end
  end
end

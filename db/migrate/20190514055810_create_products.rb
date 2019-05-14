class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :id
      t.string :name
      t.string :description
      t.integer :price
      t.string :class
      t.boolean :state

      t.timestamps
    end
  end
end

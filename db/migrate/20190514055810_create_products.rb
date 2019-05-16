class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :quantity
      t.string :class
      t.string :gender
      t.boolean :state
      t.boolean :new


      t.timestamps
    end
  end
end

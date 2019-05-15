class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :id
      t.time :date
      t.boolean :confirm_seller
      t.string :confirm_buyer

      t.timestamps
    end
  end
end

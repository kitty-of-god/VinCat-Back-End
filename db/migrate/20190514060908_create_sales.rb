class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.time :date
      t.boolean :confirm_seller
      t.string :confirm_buyer
      t.integer :seller_user_id
      t.integer :buyer_user_id
      t.timestamps
    end
  end
end

class AddSellerUserIdToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :seller_user_id, :integer
  end
end

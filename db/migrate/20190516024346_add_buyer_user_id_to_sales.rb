class AddBuyerUserIdToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :buyer_user_id, :integer
  end
end

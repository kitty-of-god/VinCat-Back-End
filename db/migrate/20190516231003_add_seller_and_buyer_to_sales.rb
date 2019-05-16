class AddSellerAndBuyerToSales < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales, :seller, user: true, foreign_key: true
    add_reference :sales, :buyer, user: true, foreign_key: true
  end
end

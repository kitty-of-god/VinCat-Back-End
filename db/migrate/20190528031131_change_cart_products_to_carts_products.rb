class ChangeCartProductsToCartsProducts < ActiveRecord::Migration[5.2]
  def change
    rename_table :cart_products, :carts_products
  end
end

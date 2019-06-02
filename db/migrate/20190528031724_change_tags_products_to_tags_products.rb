class ChangeTagsProductsToTagsProducts < ActiveRecord::Migration[5.2]
  def change
    rename_table :tags_products, :products_tags
  end
end

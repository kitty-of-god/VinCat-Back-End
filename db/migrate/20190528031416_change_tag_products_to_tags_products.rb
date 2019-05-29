class ChangeTagProductsToTagsProducts < ActiveRecord::Migration[5.2]
  def change
    rename_table :tag_products, :tags_products
  end
end

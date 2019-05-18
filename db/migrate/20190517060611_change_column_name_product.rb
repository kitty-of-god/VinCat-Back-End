class ChangeColumnNameProduct < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :class, :kind
  end
end

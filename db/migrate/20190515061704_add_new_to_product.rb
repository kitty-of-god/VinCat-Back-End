class AddNewToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :new, :boolean
  end
end

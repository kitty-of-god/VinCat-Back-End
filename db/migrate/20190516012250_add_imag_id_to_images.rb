class AddImagIdToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :imag_id, :integer
  end
end

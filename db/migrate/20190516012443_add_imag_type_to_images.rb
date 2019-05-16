class AddImagTypeToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :imag_type, :string
  end
end

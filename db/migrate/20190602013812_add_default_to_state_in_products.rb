class AddDefaultToStateInProducts < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:products, :state, from: nil, to: true)
  end
end

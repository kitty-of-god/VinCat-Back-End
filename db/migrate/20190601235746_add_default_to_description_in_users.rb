class AddDefaultToDescriptionInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :description, from: nil, to: "")
  end
end

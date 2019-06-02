class AddDefaultToResidenceInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :residence, from: nil, to: "")
  end
end

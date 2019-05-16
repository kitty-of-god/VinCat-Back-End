class ChangeColumnNameRating < ActiveRecord::Migration[5.2]
  def change
    rename_column :ratings, :id, :rate_id
    rename_column :ratings, :type, :rate_type
  end
end

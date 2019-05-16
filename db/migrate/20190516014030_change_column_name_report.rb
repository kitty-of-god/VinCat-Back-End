class ChangeColumnNameReport < ActiveRecord::Migration[5.2]
  def change
    rename_column :reports, :id, :repo_id
    rename_column :reports, :type, :repo_type
  end
end

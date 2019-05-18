class RenameColumnTypeInRatingstoKind < ActiveRecord::Migration[5.2]
  def change
    rename_column :ratings, :type, :kind
  end
end

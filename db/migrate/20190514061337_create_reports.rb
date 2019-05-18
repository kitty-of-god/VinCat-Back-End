class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :body
      t.integer :reportable_id
      t.string :reportable_type
      t.timestamps
    end
    add_index :reports, [:reportable_id, :reportable_type]
  end
end

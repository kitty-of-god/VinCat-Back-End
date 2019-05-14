class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :id
      t.string :body
      t.string :type

      t.timestamps
    end
  end
end

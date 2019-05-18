class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|

      t.string :comment
      t.string :type
      t.integer :rating
      t.integer :rateable_id
      t.string :rateable_type
      t.timestamps
    end
    add_index :ratings, [:rateable_id, :rateable_type]
  end
end

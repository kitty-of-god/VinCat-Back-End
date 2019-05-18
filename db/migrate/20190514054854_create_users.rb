class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :description
      t.string :password
      t.string :residence
      t.string :type

      t.timestamps
    end
  end
end

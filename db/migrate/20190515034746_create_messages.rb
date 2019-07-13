class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

      t.string :text
      t.references :chat, index: true
      t.references :user, index: true
      t.boolean :read, :default => false
      t.timestamps
    end
  end
end

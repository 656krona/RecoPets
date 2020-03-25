class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :name, null: false
      t.integer :days, null: false
      t.float :amount, null: false

      t.timestamps
    end
  end
end

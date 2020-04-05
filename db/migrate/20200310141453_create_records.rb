class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer :pet_id
      t.integer :hospital_id
      t.datetime :start_time
      t.boolean :content_type,default: 0
      t.string :memo
      t.string :history
      t.string :record_image_id
      t.decimal :score, precision: 5, scale: 3

      t.timestamps
    end
  end
end

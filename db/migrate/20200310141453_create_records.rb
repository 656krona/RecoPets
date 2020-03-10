class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer :pet_id
      t.integer :hospital_id
      t.datetime :date
      t.boolean :content_type
      t.string :memo
      t.string :record_image_id

      t.timestamps
    end
  end
end

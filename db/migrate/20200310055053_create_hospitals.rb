class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :postcode
      t.string :prefecture_name
      t.string :address_city
      t.string :address_street
      t.string :phone

      t.timestamps
    end
  end
end

class Hospital < ApplicationRecord
  has_many :records

  def self.search(name, prefecture_name)
    hospitals = Hospital.all
    unless name.blank?
      hospitals = hospitals.where(['name LIKE ?', "%#{name}%"])
    end
    unless prefecture_name.blank?
      hospitals = hospitals.where(['prefecture_name = ?', prefecture_name])
    end
    hospitals
  end

end

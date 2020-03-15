class Hospital < ApplicationRecord
  has_many :records

  def self.search(name, prefecture_name)
    if name.blank? && prefecture_name.blank?
      Hospital.all
    elsif !name.blank? && prefecture_name.blank?
      Hospital.where(['name LIKE ?', "%#{name}%"])
    elsif name.blank? && !prefecture_name.blank?
      Hospital.where(['prefecture_name LIKE ?', "#{prefecture_name}"])
    elsif !name.blank? && !prefecture_name.blank?
      Hospital.where(['name LIKE ?', "%#{name}%"]).where(['prefecture_name LIKE ?', "#{prefecture_name}"])
    end
  end

end

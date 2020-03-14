class Hospital < ApplicationRecord
  has_many :records

  def self.search(search,prefecture_name)
    if search
      Hospital.where(['name LIKE ?', "%#{search}%"])
    elsif prefecture_name != nil
      Hospital.where(['prefecture_name LIKE ?', "#{prefecture_name}"])
    else
      Hospital.all
    end
  end

end

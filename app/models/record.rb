class Record < ApplicationRecord
  belongs_to :pet
  belongs_to :hospital, optional: true
  attachment :record_image

  scope :date,       -> { where('start_time >= ?', Date.current) }
  scope :type,       -> { where(content_type: 1) }
  scope :pet,        -> (pet_id) { where(pet_id: pet_id) }
  # start_timeカラムが直近日付のレコードを取得する
  scope :sorted,     -> { order(:start_time).first }

  class << self
    def date_type_pet_sorted(pet_id)
      date.type.pet(pet_id).sorted
    end
  end
end



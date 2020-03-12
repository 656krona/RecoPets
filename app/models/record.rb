class Record < ApplicationRecord
  belongs_to :pet
  belongs_to :hospital
  attachment :record_image
end

class Record < ApplicationRecord
  belongs_to :pet
  belongs_to :hospital, optional: true
  attachment :record_image
end

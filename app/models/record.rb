class Record < ApplicationRecord
  belongs_to :user
  belongs_to :hospital
  attachment :record_image
end

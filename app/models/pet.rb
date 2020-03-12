class Pet < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  attachment :pet_image
end

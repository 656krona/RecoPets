class Pet < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  attachment :pet_image

  validates :name, presence: true

  def create_a_month_records(date_str)
    date = date_str.present? ? date_str.to_date : Date.current

    return if records.where(start_time: date.beginning_of_month.strftime("%Y-%m-%d 15:%M:%S")).present?

    firstday, lastday = date.beginning_of_month, date.end_of_month
    (firstday..lastday).each do |day|

      records.create(start_time: day)
    end
  end
end

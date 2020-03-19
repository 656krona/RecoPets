class Item < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :days, presence: true

  def count
    require = 'date'
    if amount == 100
      d1 = Date.today
      d2 = updated_at.to_date
      #d3 = d1 + days
      d3 = (d1 - d2).to_i
      (100 - (d3/days.to_f.round(2)) * 100).round
      #binding.pry
    elsif amount != 100
      p1 = (100 / days.to_f.round(2)).round
      d1 = Date.today
      d2 = updated_at.to_date
      d3 = amount / p1#あと何日もつかdaysと同義
      d4 = (d1 - d2).to_i
      (amount - (d4/d3.to_f.round(2)) * 100).round
      #binding.pry
    end
  end

end
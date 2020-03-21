class Item < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :days, presence: true

  def remaining_per
    update_elapsed_days = (Date.current - updated_at.to_date).to_i # 更新してからの経過日数

    per_one_day = 100 / days
    remaining_days = amount / per_one_day #あと何日もつかdaysと同義
    # result = (amount - (update_elapsed_days / d3.to_f.round(2)) * 100).round
    result = (update_elapsed_days / remaining_days.to_f.round(2) * 100 - amount).round
    result.round(2).abs # 小数点2位で四捨五入
  end

end
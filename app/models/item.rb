class Item < ApplicationRecord
  belongs_to :user

  validates :name, presence: {message: "を入力してください"}
  validates :days, presence: {message: "を入力してください"}
  validates :amount, presence: {message: "を入力してください"}

  def remaining_per
    update_elapsed_days = (Date.current - updated_at.to_date).to_i # 更新してからの経過日数

    per_one_day = 100 / days #1日あたりの減量(%)
    remaining_days = amount / per_one_day #あと何日もつかdaysと同義
    # 'あと何日もつか（日数）'の内の'経過日数'の割合を%に直してamountから引く
    result = (update_elapsed_days / remaining_days.to_f.round(2) * 100 - amount).round
    result.round(2).abs # 小数点2位で四捨五入
  end

end
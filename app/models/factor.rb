class Factor < ActiveRecord::Base
  belongs_to :dimention
  validates :title, presence: true
  validates :weight, presence: true
end

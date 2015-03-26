class Priority < ActiveRecord::Base
  validates :title, presence: true
  validates :weight, presence: true
  has_many :dimentions
end

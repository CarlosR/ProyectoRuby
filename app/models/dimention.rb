class Dimention < ActiveRecord::Base
  belongs_to :priority
  validates :title, presence: true
  validates :weight, presence: true
  has_many :factors

  def get_priority(id)
      @dimention = Dimention.find(id)
      @dimention.title
  end
end

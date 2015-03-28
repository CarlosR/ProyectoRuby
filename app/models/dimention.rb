class Dimention < ActiveRecord::Base
  belongs_to :priority
  validates :title, presence: true
  validates :weight, presence: true
  has_many :factors
  accepts_nested_attributes_for :factors

  def get_priority(id)
      @priority = Priority.find(id)
      @priority.title
    end
end

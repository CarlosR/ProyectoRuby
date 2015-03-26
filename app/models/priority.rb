class Priority < ActiveRecord::Base
  validates :title, presence: true
  validates :weight, presence: true
  
  has_many :dimentions
  validates_numericality_of :weight,  greater_than_or_equal_to: 0
  validates_numericality_of :weight, less_than_or_equal_to: 100
  default_scope order('weight DESC')
  
  accepts_nested_attributes_for :dimentions
end

class User < ActiveRecord::Base
  belongs_to :company
  validates_presence_of :name, :email, :permission
  validates :email, uniqueness: true
  has_secure_password
end

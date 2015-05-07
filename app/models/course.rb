class Course < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true

  has_many :memberships
  has_many :students, through: :memberships
end

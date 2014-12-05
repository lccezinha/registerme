class Student < ActiveRecord::Base
  validates :name, presence: true
  validates :register_number, presence: true
  validates :register_number, format: { with: /[A-Z]{3}[1-9]{6}/ }

  has_many :memberships
  has_many :courses, through: :memberships
end

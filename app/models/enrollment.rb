class Enrollment < ApplicationRecord
  has_many :bills
  belongs_to :student
end

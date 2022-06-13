class Course < ApplicationRecord
  has_many :reservations, dependent: :destroy
end

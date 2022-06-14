class Course < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, :description, :size, :location, :price, presence: true
end

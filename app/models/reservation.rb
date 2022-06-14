class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :date, :city, presence: true
end

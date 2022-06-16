class User < ApplicationRecord
  has_many :reservations, dependent: :destroy

  # validates :email, uniqueness: true, presence: true
  validates :name, presence: true
end

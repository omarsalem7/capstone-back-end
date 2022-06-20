class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :reservations, dependent: :destroy

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
end

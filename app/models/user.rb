class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy

  validates :email, uniqueness: true, presence: true
  validates :password, presence: { message: 'password field cannot be left blank' }
  validates :name, presence: true
end

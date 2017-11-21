class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, format: { with: (/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i), message: "format is incorrect*"}

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :password, presence: true, length: { :in => 7..20, message: "password too short" }, on: :create

  has_many :items, dependent: :destroy
end

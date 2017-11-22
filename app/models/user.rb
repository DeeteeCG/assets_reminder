class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: (/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i), message: "format is incorrect*"}

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :password, presence: true, length: { :in => 7..20, message: "password too short" }, on: :create

  enum role: [ :user, :admin ]

  has_many :items, dependent: :destroy

  def self.search(search)
    # search = search.downcase
    self.where("first_name ILIKE ? OR
                last_name ILIKE ?",
                "%#{search}%",
                "%#{search}%")
  end
end

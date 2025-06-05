class Usuario < ApplicationRecord
  has_secure_password

  validates :usuario, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end

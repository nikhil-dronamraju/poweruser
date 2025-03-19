class User < ApplicationRecord
  has_secure_password validations: false
  validates :first_name, presence: true
  validates :email, presence: { message: "Email can't be blank" }, uniqueness: { message: "Email already taken." }
  validates :username, presence: { message: "Username can't be blank" }, uniqueness: { message: "Username already taken." }
  validates :password, presence: true
end

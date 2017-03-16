class User < ActiveRecord::Base

  has_secure_password
  # has_many :reviews

  validates :first_name, presence: { message: "A first name must be specified" }, length: { minimum: 3, message: "must be at least (3) characters long" }
  validates :last_name, presence: { message: "A last name must be specified" }, length: { minimum: 3, message: "must be at least (3) characters long" }
  validates :email, presence: { message: "An email must be specified" }, length: { minimum: 5, message: "must be at least (5) characters long" }
  validates :password, presence: { message: "A password must be specified" }, length: { in: 6..20, message: "must be between 6-20 characters long" }

end

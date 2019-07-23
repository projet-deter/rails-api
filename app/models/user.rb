class User < ApplicationRecord
  
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  #validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, allow_blank: false, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "only allows valid emails" }
  validates :password_digest, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false

  #encrypt password
  has_secure_password

end

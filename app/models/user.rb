class User < ApplicationRecord
  
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  #validations
  validates :email, presence: true, allow_blank: false, uniqueness: true
  validates :password_digest, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false

  #encrypt password
  has_secure_password

end

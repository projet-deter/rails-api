class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  #scope :authored_by, ->(name) { where(user: User.where(name: name)) }

  validates :title, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :category_id, presence: true, allow_blank: false

end

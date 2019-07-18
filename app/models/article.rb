class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  scope :authored_by, ->(username) { where(user: User.where(username: username)) }

  validates :title, presence: true, allow_blank: false
  validates :body, presence: true, allow_blank: false
  validates :slug, uniqueness: true, exclusion: { in: ['feed'] }

  before_validation do
      self.slug ||= "#{title.to_s.parameterize}-#{rand(36**6).to_s(36)}"
 end
end

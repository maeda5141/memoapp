class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true
  validates :public, presence: true
  validates :user, presence: true
end

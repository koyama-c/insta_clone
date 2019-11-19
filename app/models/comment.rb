class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, presence: true  
  has_many :notifications, dependent: :destroy  
end

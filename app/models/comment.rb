class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :text, length: { maximum: 15 }
end

class Post < ApplicationRecord
  belongs_to :user
  has_many   :comments

  validates :text,            length: { maximum: 50 } ,  presence: true
  validates :title,           length: { maximum: 20 } ,  presence: true
  validates :image,                                      presence: true
  validates :author,          length: { maximum: 20 } ,  presence: true
  validates :introduction,    length: { maximum: 120 } , presence: true

  mount_uploader :image, ImageUploader
end
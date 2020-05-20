class Post < ApplicationRecord
  validates :text,            length: { maximum: 50 } ,  presence: true
  validates :title,           length: { maximum: 20 } ,  presence: true
  validates :image,           length: { maximum: 30 } ,  presence: true
  validates :author,          length: { maximum: 20 } ,  presence: true
  validates :introduction,    length: { maximum: 120 } , presence: true
end
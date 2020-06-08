class User < ApplicationRecord
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments

  validates :name, presence: true, uniqueness: true


  def update_without_current_password(params, *options)
    params.delete(:current_password)
    # "パスワード変更のためのパスワード入力フィールド"と"その確認フィールド"の両方とも空の場合のみ、パスワードなしで更新できるようにする
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
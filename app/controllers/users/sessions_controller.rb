class Users::SessionsController < Devise::SessionsController
  def new_guest
    # ゲストユーザがなくとも作成できるように、find_or_create_by!メソッドを使う
    user = User.find_or_create_by!(email: 'guest@example.com', name: '野良猫(ゲスト)') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
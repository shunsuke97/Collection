class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: [:edit, :destroy]

  # ゲストユーザの場合に、deviseのedit,destroyアクションを止める
  def check_guest
    if current_user.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの編集・削除はできません。'
    end
  end

end
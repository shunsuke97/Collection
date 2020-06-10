require 'rails_helper'

describe User do
  describe '#create' do
    # 1
    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    # 2
    it " nameがない場合は登録できないこと" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("が入力されていません。")
    end
    # 3
    it " nameが9文字以上のときは登録できないこと" do
      user = build(:user, name: "123456789")
      user.valid?
      expect(user.errors[:name]).to include("は8文字以下に設定して下さい。")
    end
    # 4
    it "nameが8文字以下のときには登録できること " do
      user = build(:user, name: "12345678")
      expect(user).to be_valid
    end
    # 5
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end
    # 6
    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に使用されています。")
    end
    # 7
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end
    # 8
    it " passwordが6文字以上であれば登録できること " do
      user = build(:user, password: "123456", password_confirmation: "123456")
      expect(user).to be_valid
    end
    # 9
    it "passwordが5文字以下の場合は登録できないこと" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
    end
    # 10
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("が内容とあっていません。")
    end
  end
end
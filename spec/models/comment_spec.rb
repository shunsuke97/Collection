require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントの保存' do
    context "コメントが保存できる場合" do
      it "textがあればコメントは保存される" do
        expect(@comment).to be_valid
      end
    end
  end
end


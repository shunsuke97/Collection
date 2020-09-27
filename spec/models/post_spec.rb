require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿の保存' do
    # 投稿が保存できるとき
    context "投稿が保存できる場合" do
      it "フレーズ、タイトル、著者、説明、画像があれば投稿は保存される" do
        expect(@post).to be_valid
      end
    end
    # 投稿が保存できないとき
    context "投稿が保存できない場合" do
      # 1
      it "フレーズがないと投稿は保存できない" do
        @post.text = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("「フレーズ」 を入力してください")
      end
      # 2
      it "フレーズが61文字以上だと投稿は保存できない" do
        @post.text = "a" * 61
        @post.valid?
        expect(@post.errors.full_messages).to include("「フレーズ」 は60文字以内で入力してください")
      end
      # 3
      it "タイトルがないと投稿は保存できない" do
        @post.title = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("「タイトル」 を入力してください")
      end
      # 4
      it "タイトルが21文字以上だと投稿は保存できない" do
        @post.title = "a" * 21
        @post.valid?
        expect(@post.errors.full_messages).to include("「タイトル」 は20文字以内で入力してください")
      end
      # 5
      it "著者がないと投稿は保存できない" do
        @post.author = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("「著者」 を入力してください")
      end
      # 6
      it "著者が13文字以上だと投稿は保存できない" do
        @post.author = "a" * 13
        @post.valid?
        expect(@post.errors.full_messages).to include("「著者」 は12文字以内で入力してください")
      end
      # 7
      it "説明がないと投稿は保存できない" do
        @post.introduction = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("「説明」 を入力してください")
      end
      # 8
      it "説明が131文字以上だと投稿は保存できない" do
        @post.introduction = "a" * 131
        @post.valid?
        expect(@post.errors.full_messages).to include("「説明」 は130文字以内で入力してください")
      end
      # 9
      it "画像がないと投稿は保存できない" do
        @post.image = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("「画像」 を選択してください")
      end
    end
  end
end

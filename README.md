## :mag: アプリURL
http://18.178.89.167

## :mag: 概要
このCollectionは、自分が出会ったとっておきのフレーズ”を作品から引用し、投稿し合うアプリです。
投稿はもちろんのこと、投稿に対してコメントもできます。
投稿一覧は登録なしでも閲覧可能なので、ぜひ見てみて下さい。投稿やコメントをお試しになりたい際には、かんたんログインよりゲストユーザーとしてログインして下さい。
機能一覧に関しては、下記を参照してください。

## :mag: 使用技術(開発環境)
【バックエンド】
- Ruby 2.5.1
- Rails 5.2.4.3
- MySQL
- Github
- RSpec
- Nginx
- Unicorn
- AWS(EC2.S3)
- Capistrano
【フロントエンド】
- Haml.Sass.Bootstrap
- JavaScript.jQuery

## :green_book: 機能一覧
・ユーザー新規登録機能
・ログイン/ログアウト機能
・ユーザー編集/削除機能
・かんたんログイン機能
・投稿一覧
・投稿検索機能
・各ユーザー投稿一覧
・ページネーション機能
・記事投稿/編集/削除機能
・画像投稿機能
・コメント投稿機能
・Ajax通信によるコメント非同期化
・RSpecによる単体テスト

## :green_book: DEMO
### 投稿一覧

### 投稿機能

### かんたんログイン

### 投稿検索

## :green_book: 制作意図
 自分自身、本を読んだり映画などの作品を観ることがとても好きで、心に残ったコメントやあらすじなどをメモをしていたが、せっかく良い作品に触れてもそれを共有できる場が少ないなと思っており、自分で何か作りたいなと思っていました。
 ある日、Twitterで「映画や漫画、小説などで出会った口説き文句や名言を教えてください」という内容のツイートが5万イイネ ＋ コメントも多数あるのを見かけて、「やはりみんなこういう話題は好きなんだなあ」と実感し、”新たに言葉に出会う体験”というのは需要も一定数あるなと思い、今回この「心に残ったフレーズを投稿し合うサービス」であるCollectionを制作しました。
その他、箇条書きですが、このアプリを作るに至った背景は以下です↓
・「作品の心に残ったフレーズや場面」のみを共有できる限定的なプラットフォームは知る限り少ない。Twitterとかだと、他の話題やタイムラインに埋もれていってしまう。
・せっかく出会った良い作品を自分の中だけに留めておいては勿体ない。
・「誰かが心を揺さぶられた瞬間」のみを共有するアプリがあれば、”何か落ち込んだとき”、”新しい出会いが欲しくなったとき”、”人に自慢したくなるような良い作品に巡り会えたとき”、などに多いに役立つはず。

## :green_book: 工夫したポイント
・GithubのPull requestsを活用し、機能ごとにブランチを作成して疑似チーム開発として実装を進めた。
・無駄な機能を省いて”言葉に触れる機会”にのみフォーカスしてもらえるようなデザインにした。

## :green_book: 今後追加したい機能
・投稿検索機能非同期化
・いいね機能/いいね一覧
・フォロー機能/フォロー一覧
・テスト項目の追加

## :green_book: DB設計
### usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|pass|string|null: false|
#### Association
- has_many :posts
- has_many :comments

### postsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|text|string|null: false|
|title|string|null: false|
|image|string|null: false|
|author|string|null: false|
|introduction|text|null: false|
#### Association
- belongs_to :user
- has_many :comments

### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|post_id|integer|null: false|
|text|text|null: false|
#### Association
- has_many :posts
- has_many :comments
Furima ER

## users テーブル

|Column               |Type  |Options                  |
|---------------------|------|-------------------------|
|nickname             |string|null:false               |  
|email                |string|null:false, unique: true |
|encrypted_password   |string|null:false               |
|family_name          |string|null:false               |
|first_name           |string|null:false               |  
|family_name_kana     |string|null:false               |
|first_name_kana      |string|null:false               |
|birthdate            |date  |null:false               |

## Association

has_many :orders
has_many :items

## items テーブル

|Column               |Type  |Options                          |
|---------------------|------|---------------------------------|
|name                 |string|null:false                       |
|description          |text  |null:false                       |
|category_id          |integer|null:false                      |
|status_id            |integer|null:false                      |  
|responsibility_id    |integer|null:false                      |
|region_id            |integer|null:false                      |
|time_id              |integer|null:false                      |
|price                |integer|null:false                      |
|user                 |references|null: false,foreign_key: true|


## Association

belongs_to :user
has_one :order

## orders テーブル

|Column               |Type  |Options                           |
|---------------------|------|----------------------------------|
|user                 |references|null:false,foreign_key: true  |  
|item                 |references|null:false,foreign_key: true  |


## ## Association

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

|Column               |Type  |Options                          |
|---------------------|------|---------------------------------|
|order                |references|null: false,foreign_key: true|   
|postal_code          |string|null:false                       |
|region_id            |integer|null:false                      |
|city                 |string|null:false                       |
|street               |string|null:false                       |  
|building_name        |string|                                 |
|phone_number         |string|null:false                       |        

## ## Association

belongs_to :order

アプリケーション名
furima-40949

アプリケーション概要
商品の出品・表示・編集・削除・購入などを行うフリーマーケットアプリケーションです

URL
https://github.com/shogoshogoshogoshogo/furima-40949

テスト用アカウント
Basic認証ID: admin
Basic認証パスワード: 2222

利用方法

登録機能
トップページ（一覧ページ）のヘッダーから「ユーザー新規登録」を行う。
会員情報入力から会員登録をし「会員登録」ボタンを押す


タイトル
詳細
目標達成日
カテゴリ
画像
投稿を送信し、「達成状況リスト」を表示。
他者を励ます機能
一覧ページから目標をクリックして、目標の詳細を確認する。
応援したい目標があれば、以下の操作を行う：
ユーザーのフォロー
目標のお気に入り登録
コメントまたはメッセージを送る

アプリケーションを作成した背景
社会の中で「不要になった物を捨てるだけではなく、必要とする人へ届けたい」というニーズがある一方で、効率的で信頼性の高いプラットフォームが不足しているという課題を抱えていることが明らかになりました。特に、売買における出品者と購入者間のトラブルや、配送地域や方法の不明確さが要因であると考えられます。

この課題を解決するために、ユーザーが簡単かつ安全に商品を売買できるプラットフォーム「Furima」を開発することにしました。本アプリケーションでは、直感的な出品・購入機能に加え、配送先情報や商品の状態を正確に管理し、ユーザー間の信頼性を向上させる仕組みを実現しました。

洗い出した要件
（要件の詳細を記載）

実装した機能
画像やGIF、説明を記載する
実装予定の機能
投稿機能を更に充実化。
目標のイメージ共有のためのSNS認証機能を追加予定。
データベース設計
mermaid
コピーする
編集する
erDiagram
USERS {
  string name
  string email
  string password
}
POSTS {
  string title
  text text
  string image
  date target_date
  int genre_id
}
COMMENTS {
  text text
  int post_id
  int user_id
}
CATEGORIES {
  string genre
}
FOLLOWS {
  int follower_id
  int followee_id
}
FAVORITES {
  int post_id
  int user_id
}
画面遷移図
ユーザーログインページ
ユーザー新規登録ページ
ユーザーマイページ
投稿ページ
詳細ページ
編集ページ
削除完了ページ
フォロー一覧ページ
お気に入り一覧ページ
開発環境
フロントエンド: [ツール・技術名]
バックエンド: [ツール・技術名]
インフラ: [ツール・技術名]
テスト: [ツール・技術名]
テキストエディタ: [使用したエディタ]
タスク管理: [使用したツール]
ローカルでの動作方法
以下のコマンドを順に実行してください：

bash
コピーする
編集する
% git clone https://github.com/xxxxx
% cd xxxxxx
% bundle install
% rails db:create
% rails db:migrate
% rails db:seed
% rails s
工夫したポイント
企業へPRしたい事項を記載
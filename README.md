Furima ER
[![Image from Gyazo](https://i.gyazo.com/a4ae87b27f14783b885766a78321c6be.gif)](https://gyazo.com/a4ae87b27f14783b885766a78321c6be)
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
1.トップページ（一覧ページ）のヘッダーから「ユーザー新規登録」を行う。
2.会員情報入力から会員登録をし「会員登録」ボタンを押す

出品機能
1.「出品」ボタンを押す
2.商品の情報を入力する
3.「出品する」ボタンを押す

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
% git clone https://github.com/shogoshogoshogoshogo/furima-40949
% cd furima-40949
% bundle install
% rails db:create
% rails db:migrate
% rails db:seed
% rails s

工夫したポイント
1. アプリケーションの差別化ポイント
「Furima」は、単なるフリーマーケットアプリではなく、ユーザー体験を向上させるために以下の工夫を施しました：

出品・購入の効率化
直感的なUI/UX設計で、ユーザーが短時間で出品・購入を完了できる仕組みを実現。
配送先情報の明確化
注文と配送情報を結びつけるデータベース設計により、配送トラブルを軽減。
安全性の確保
Basic認証やユニーク制約を利用し、なりすましや重複登録を防止。
2. 開発過程でのスキルと実績
このアプリケーションの開発過程で、以下のスキルを磨きました：

データベース設計スキル
ER図を作成し、正規化を意識したテーブル設計を行いました。特に外部キー制約を適切に設定し、参照整合性を保ちました。
バックエンドの実装能力
Ruby on Railsを活用して、以下の機能を効率的に構築しました：
ユーザー認証機能（Deviseを活用）
商品のCRUD機能
購入時のバリデーションと外部APIの利用（Pay.jpなど）
フロントエンドとの連携
JavaScriptを使用して非同期通信（Ajax）を実現し、よりスムーズな操作感を提供しました。
3. 解決した課題
不要品の廃棄による環境問題
本アプリケーションは「捨てる」ではなく「次の人に届ける」という文化を促進します。
信頼性の向上
配送情報や商品の状態を明確にし、売買トラブルの発生率を低下させました。
4. 企業での活用イメージ
「Furima」で得たスキルを活かし、御社のプロダクト開発に以下の形で貢献できます：

効率的なデータベース設計
貴社での新規アプリ開発や既存システムのリファクタリングに役立つ設計力を提供します。
フルスタックエンジニアリング
フロントエンドからバックエンドまで一貫して対応し、円滑な開発プロセスをサポートします。
ユーザー視点での改善提案
実際に構築・運用する中で得た経験をもとに、UI/UX改善の提案を行います。
5. 成果物の技術的な特徴
高い可読性と保守性
コードレビューを意識し、命名規則やリファクタリングを徹底しました。
開発環境の整備
開発から本番運用までをスムーズに行うためのDocker環境を構築可能です（必要に応じて追加学習済み）。
テスト駆動開発（TDD）
RSpecを使用して、モデルやコントローラの単体テスト、統合テストを実施しました。
6. 企業での目標
ユーザーに価値を提供するプロダクトづくり
「必要な人に適切な価値を届ける」仕組みを御社でのプロジェクトにも活かします。
チーム開発への貢献
Git/GitHubを用いたチーム開発の経験を活かし、円滑なコミュニケーションや効率的なタスク管理を実践します。


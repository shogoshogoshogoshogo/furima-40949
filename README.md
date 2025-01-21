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
ユーザー管理機能

ユーザーが新規登録・ログイン・ログアウトできる仕組みを実装する。
登録時には、入力された情報が正確であることをバリデーションで保証する。
商品出品機能

出品者が商品名、説明、カテゴリ、価格などの情報を登録できる。
商品価格を入力すると、JavaScriptを用いて手数料と利益をリアルタイムに計算し表示する。
商品一覧表示機能

トップページに出品された商品を新着順で一覧表示する。
商品名、価格、画像、状態を表示する。
商品詳細表示機能

選択した商品の詳細情報（画像、説明、価格、状態など）を表示する。
ログイン状態やユーザーの権限に応じて、「購入ボタン」や「編集・削除ボタン」を切り替える。
商品編集・削除機能

出品者が商品の情報を編集または削除できる。
編集画面で既存の情報を反映させ、再入力の手間を省く。
商品購入機能

購入者が配送先情報を入力し、商品を購入できる。
クレジットカード決済（Pay.jp）を利用して安全に支払いを行う。
配送先情報管理機能

購入時に入力された配送先情報を保存し、購入履歴と紐付ける。
郵便番号や電話番号の形式をバリデーションでチェックする。
商品検索機能（オプション）

キーワードやカテゴリを使って商品を検索できる。
セキュリティ機能

Basic認証を導入し、不特定多数のアクセスを制限する。
ユーザー情報は暗号化して保存（Deviseのencrypted_passwordを使用）。
待機中の表示制御

購入済みの商品には「Sold Out」と表示し、購入不可の状態を明確にする。
管理画面の要件（必要に応じて）

管理者がユーザーや商品の登録状況を確認・管理できる仕組み。


実装した機能
ユーザー管理機能
Deviseを使用したユーザーの新規登録、ログイン、ログアウト機能を実装。
登録時にバリデーションを設け、正確な情報のみ登録可能に設定。
Basic認証を導入し、アプリケーションの安全性を確保。
商品出品機能
商品の名前、説明、カテゴリ、状態、配送料負担、発送地域、発送日数、価格を登録可能。
価格入力時にJavaScriptを用いて手数料・利益をリアルタイムで計算。
各種Active Hashを活用して効率的にカテゴリや発送情報を管理。
商品一覧表示機能
出品された商品をトップページに新着順で表示。
商品画像、名前、価格、状態を一覧で確認可能。
商品詳細表示機能
商品の詳細情報を個別ページで確認可能。
ログイン状態や出品者の有無によって、「購入」や「編集・削除」ボタンの表示を切り替え。
商品編集・削除機能
出品者が商品の情報を編集・削除可能。
編集画面で既存の情報が反映されるよう設定。
商品購入機能
Pay.jpを活用したクレジットカード決済機能を実装。
購入時に配送先情報を入力し、購入履歴と紐付けて保存。
購入済みの商品には「Sold Out」を表示し、二重購入を防止。
商品検索機能（オプション）
商品をカテゴリやキーワードで検索可能（未実装の場合、この項目は削除）。
テスト機能
RSpecとFactoryBotを使用して、モデル・コントローラの単体テストを実施。
ユーザー登録や商品出品、購入などの機能を網羅的にテスト。


開発環境
フロントエンド: [HTML/CSS,JavaScript]
バックエンド: [Ruby on Rails,Devise,Active Record]
インフラ: [MySQL,AWS EC2,Pay.jp]
テスト: [RSpec,FactoryBot,Capybara]
テキストエディタ: [Visual Studio Code]
タスク管理: [Git/GitHub]

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


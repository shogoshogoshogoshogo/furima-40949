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

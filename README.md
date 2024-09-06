Furima ER

## users テーブル

|Column               |Type  |Options                  |
|---------------------|------|-------------------------|
|nickname             |string|null:false,              |  
|email                |string|null:false, unique: true |
|encrypted_password   |string|null:false               |
|family_name          |string|null:false               |
|first_name           |string|null:false               |  
|family_name_kana     |string|null:false               |
|first_name_kana      |string|null:false               |
|birthdate            |date  |null:false               |

## items テーブル

|Column               |Type  |Options                          |
|---------------------|------|---------------------------------|
|image_file           |string|null:false                       |  
|name                 |string|null:false                       |
|description          |text  |null:false                       |
|category             |string|null:false                       |
|status               |string|null:false                       |  
|responsibility       |string|null:false                       |
|region               |string|null:false                       |
|time                 |string|null:false                       |
|price                |integer|null:false                      |
|user                 |reference|null: false,foreign_key: true |
|order                |reference|null: false,foreign_key: true |


## orders テーブル

|Column               |Type  |Options                           |
|---------------------|------|----------------------------------|
|user                 |reference|null:false, foreign_key:true   |  
|item                 |reference|null:false, foreign_key:true   |





## addresses テーブル

|Column               |Type  |Options                  |
|---------------------|------|-------------------------|
|order                |reference|                      |  
|postal_code          |string|null:false               |
|prefecture           |integer|null:false              |
|city                 |string|null:false               |
|street               |string|null:false               |  
|building_name        |string|                         |
|phone_number         |string|null:false               |
